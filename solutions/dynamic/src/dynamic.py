import random
import sys

import jpamb
import jvm
import jvm.state as jvmc

def to_int32(value: int) -> int:
    """
    Convert a Python integer to a signed Java 32-bit integer.
    """
    return (value + (1 << 31)) % (1 << 32) - (1 << 31)


def java_division(v1: int, v2: int) -> int:
    """
    Java integer division truncates toward zero.
    """
    quotient = abs(v1) // abs(v2)

    if (v1 < 0) != (v2 < 0):
        quotient = -quotient

    return to_int32(quotient)

def binary(op, v1: int, v2: int) -> int | str:
    match op:
        case jvm.BinaryOpr.Div:
            if v2 == 0:
                return "divide by zero"
            return java_division(v1, v2)

        case jvm.BinaryOpr.Rem:
            if v2 == 0:
                return "divide by zero"
            quotient = java_division(v1, v2)
            return to_int32(v1 - quotient * v2)

        case jvm.BinaryOpr.Add:
            return to_int32(v1 + v2)

        case jvm.BinaryOpr.Sub:
            return to_int32(v1 - v2)

        case jvm.BinaryOpr.Mul:
            return to_int32(v1 * v2)

        case _:
            raise NotImplementedError(
                f"Unhandled binary operation {op!r}"
            )


def compare(op, v1: int, v2: int) -> bool:
    match op:
        case jvm.CmpOpr.Eq:
            return v1 == v2

        case jvm.CmpOpr.Ne:
            return v1 != v2

        case jvm.CmpOpr.Lt:
            return v1 < v2

        case jvm.CmpOpr.Le:
            return v1 <= v2

        case jvm.CmpOpr.Gt:
            return v1 > v2

        case jvm.CmpOpr.Ge:
            return v1 >= v2

        case _:
            raise NotImplementedError(
                f"Unhandled comparison {op!r}"
            )


def step(bc: jpamb.Bytecode, state: jvmc.State) -> tuple[jvmc.PC, jvmc.State | str]:
    assert isinstance(state, jvmc.State), f"expected state but got {state}"
    frame = state.frames.peek()
    pc = frame.pc
    opr = bc[pc]
    output = state
    print(f"Stepping {pc}:\n > {opr}", file=sys.stderr)
    match opr:
        case jvm.Dup():
            v1 = frame.stack.pop()
            frame.stack.push(v1)
            frame.stack.push(v1)
            frame.pc += 1

        case jvm.Ifz(condition=c, target=t):
            assert isinstance (c,jvm.CmpOpr), f"expected comparison op, but got {type(c)}"
            assert isinstance (t, int), f"expected int, but got {type(t)}"

            v1 = frame.stack.pop()
            assert (isinstance(v1, jvmc.StackInt) or isinstance(v1,jvmc.StackReference)), f"expected int or reference, but got {v1}"
            result = compare(c, v1.value, 0)
            
            if isinstance(result, str):
                output = result
            else:
                frame.pc = pc%t if result else frame.pc + 1

        case jvm.Load(type=t, index=n):
            v = frame.locals[n]
            frame.stack.push(v)
            frame.pc += 1

        case jvm.ArrayLoad(type=t):
            index, arr_ref = frame.stack.pop(),frame.stack.pop()
            if arr_ref.value == 0:
                output = "null pointer"
            else:
                arr = state.heap[arr_ref]
                if index.value < 0 or index.value >= len(arr.values):
                    output = "out of bounds"
                else:
                    arr = state.heap[arr_ref]
                    
                    val = arr.values[index.value]
                    frame.stack.push(jvmc.StackInt(val))
                    
                    frame.pc += 1

        case jvm.Incr(index=i, amount=a):
            current_val = frame.locals[i].value
            new_val = to_int32(current_val + a)
            frame.locals[i] = jvmc.StackInt(new_val)
            frame.pc += 1

        case jvm.Goto(target=t):
            frame.pc = frame.pc%t

        case jvm.Push(type=t, value=v):
            if isinstance(t, jvm.Int):
                frame.stack.push(jvmc.StackInt(v))

            elif isinstance(t, jvm.Float):
                frame.stack.push(jvmc.StackFloat(v))

            elif isinstance(t, jvm.Object) and t.name == jvm.ClassName(
                "java.lang.String"
            ):
                # Create the string in the JVM heap
                ref = state.heap.new(
                    jvmc.HeapString(v)
                )
                # Push its reference onto the operand stack
                frame.stack.push(ref)
            elif isinstance(t, jvm.Reference):
                frame.stack.push(jvmc.StackReference(v))
            else:
                raise NotImplementedError(
                    f"Push type {t} not supported!"
                )
            frame.pc += 1

        case jvm.Binary(type=jvm.Int(), operant=op):
            v2, v1 = frame.stack.pop(), frame.stack.pop()
            assert isinstance(v1, jvmc.StackInt), f"expected int, but got {v1}"
            assert isinstance(v2, jvmc.StackInt), f"expected int, but got {v2}"

            value = binary(op, v1.value, v2.value)

            if isinstance(value, str):
                output = value
            else:
                frame.stack.push(jvmc.StackInt(value))
                frame.pc += 1

        case jvm.Return(type=t):
            # Retrieve the return value, if the method has one
            val = None
            if t is not None:
                val = frame.stack.pop()
            # Remove the frame of the method that just finished
            state.frames.pop()
            # Is there a caller waiting for this method?
            if state.frames:
                caller = state.frames.peek()
                # Pass the return value back to the caller
                if val is not None:
                    caller.stack.push(val)
                # Continue after the invocation instruction
                caller.pc += 1
            else:
                # No frames remain: the entire program finished
                output = "ok"

        case jvm.Get(static=True, field=field):
            # Hack - Only handle the assertion case
            assert field.extension.name == "$assertionsDisabled"

            # Hack - Assuming assertions are never disabled
            frame.stack.push(jvmc.StackInt(0))
            frame.pc += 1

        case jvm.New(classname=jvm.ClassName("java.lang.AssertionError")):
            # Hack -- if we create an assertion error, we probably also throw it.
            output = "assertion error"

        case jvm.If(condition=c,target=t):
            val2,val1 = frame.stack.pop(), frame.stack.pop()
            result = compare(c, val1.value, val2.value)
            
            if isinstance(result, str):
                output = result
            else:
                frame.pc = pc%t if result else frame.pc + 1

        case jvm.NewArray(type=t, dim=d):
            size = frame.stack.pop()
            if size.value < 0:
                output = "negative array size"
            else:
                initial_values = [0] * size.value
                arr = jvmc.HeapArray(
                    contains=t,
                    values=initial_values
                )
                ref = state.heap.new(arr)
                frame.stack.push(ref)
                frame.pc += 1

        case jvm.ArrayStore(type=t):
            val, index, ref = frame.stack.pop(), frame.stack.pop(), frame.stack.pop()
            
            if ref.value == 0:
                output = "null pointer"
            else:
                arr = state.heap[ref]
                if index.value < 0 or index.value >= len(arr.values):
                    output = "out of bounds"
                else:
                    arr.values[index.value] = val.value
                    frame.pc += 1

        case jvm.Store(type=t,index=i):
            val = frame.stack.pop()
            frame.locals.locals[i] = val
            frame.pc+=1

        case jvm.ArrayLength():
            arr_ref = frame.stack.pop()
            
            if arr_ref.value == 0:
                output = "null pointer"
            else:
                arr = state.heap[arr_ref]
                
                length_value = len(arr.values)
                frame.stack.push(jvmc.StackInt(length_value))
                
                frame.pc += 1

        case jvm.InvokeVirtual(method=m) if (
            m.classname == jvm.ClassName("java.lang.String")
            and m.extension.name == "equals"
        ):
            # Pop the argument first, then the object receiving the call
            arg_ref = frame.stack.pop()
            obj_ref = frame.stack.pop()

            # Calling a method on null causes a null pointer error
            if obj_ref.value == 0:
                output = "null pointer"
            else:
                # Retrieve the actual objects from the heap
                obj = state.heap[obj_ref]
                # String.equals(null) returns false
                if arg_ref.value == 0:
                    result = False
                else:
                    arg = state.heap[arg_ref]
                    # Compare string contents, not references
                    result = (
                        isinstance(obj, jvmc.HeapString)
                        and isinstance(arg, jvmc.HeapString)
                        and obj.content == arg.content
                    )
                # JVM booleans are represented as 1 or 0
                frame.stack.push(
                    jvmc.StackInt(1 if result else 0)
                )
                frame.pc += 1

        case jvm.InvokeStatic(method=m):
            #to be finished (Calls, loops, Strings)
            return

        case jvm.Cast(
            from_=jvm.Int(),
            to_=jvm.Short()
        ):
            # Pop the integer from the operand stack
            value = frame.stack.pop()
            # Convert to a signed 16-bit Java short
            short_value = (
                (value.value + (1 << 15))
                % (1 << 16)
                - (1 << 15)
            )
            # JVM stores short results as integer stack values
            frame.stack.push(
                jvmc.StackInt(short_value)
            )
            frame.pc += 1

        case a:
            raise NotImplementedError(a.help())

    assert isinstance(output, (jvmc.State, str))

    return pc, output


def initial(bc: jpamb.Bytecode, methodid: jvm.AbsMethodID, input: jpamb.Input):
    frame = jvmc.Frame.from_method(bc.getmethod(methodid))
    state = jvmc.State(jvmc.Heap(), jvmc.CallStack.from_frames([frame]))
    for i, v in enumerate(input.values):
        # Convert arbitrary values into local values
        match v:
            case jpamb.case.Boolean(value):
                frame.locals[i] = jvmc.StackInt(1 if value else 0)
            case jpamb.case.Int(value):
                frame.locals[i] = jvmc.StackInt(value)
            case jpamb.case.Array(contains=type, values=values):
                match type:
                    case jvm.Char():
                        ref = state.heap.new(
                            jvmc.HeapArray(type, [ord(a) for a in values])
                        )
                    case jvm.Int():
                        ref = state.heap.new(jvmc.HeapArray(type, [a for a in values]))
                frame.locals[i] = ref
            case jpamb.case.String(value=value):
                ref = state.heap.new(jvmc.HeapString(value))
                frame.locals[i] = ref
            case a:
                raise NotImplementedError(
                    f"Do not know how to convert values of type {a!r} to a local value"
                )

    return state


def interpret():
    """The entry point for the interpreter"""

    methodid, input, max_steps = jpamb.getcase(
        "dynamic",
        "1.0",
        "best analyzers",
        ["dynamic", "python"],
        for_science=True,
    )

    suite, eff = jpamb.setup()
    bc = jpamb.Bytecode(suite, eff, {})

    state = initial(bc, methodid, input)

    last = jpamb.emit_init(state)

    for x in range(max_steps):
        pc, state = step(bc, state)
        last = jpamb.emit_step(last, pc, state)

        if isinstance(state, str):
            break

INTERESTING_INTS = [
    0,
    1, -1,
    2, -2,
    3, -3,
    5, -5,
    10, -10,
    42, -42,
    100, -100,

    # Large constant and neighboring values
    10054202,
    10054203,
    10054204,
    -10054202,
    -10054203,
    -10054204,

    # Java integer boundaries
    2147483647,
    -2147483648,
]

def fuzz_input(
    rand: random.Random,
    methodid: jvm.AbsMethodID,
    trial: int = 0
) -> jpamb.case.Input:
    values = []
    for position, param in enumerate(
        methodid.extension.params
    ):
        match param:
            case jvm.Int():
                if trial < 80:
                    # First explore interesting small/boundary values
                    index = (
                        trial // (
                            len(INTERESTING_INTS) ** position
                        )
                    ) % len(INTERESTING_INTS)
                    value = INTERESTING_INTS[index]
                else:
                    # Then explore the full Java int range
                    value = rand.randint(
                        -(1 << 31),
                        (1 << 31) - 1
                    )
                values.append(
                    jpamb.case.Int(value)
                )

            case jvm.Boolean():
                value = bool(
                    (trial // (2 ** position)) % 2
                )
                values.append(
                    jpamb.case.Boolean(value)
                )

            case jvm.Object(name=classname) if classname == jvm.ClassName(
                "java.lang.String"
            ):
                interesting_strings = [
                    "",
                    "hello",
                    "not hello",
                    "Hello",
                    "x",
                    "a",
                ]
                if trial < 80:
                    value = interesting_strings[
                        trial % len(interesting_strings)
                    ]
                else:
                    length = rand.randint(0, 10)
                    value = "".join(
                        rand.choice("abcdefghijklmnopqrstuvwxyz")
                        for _ in range(length)
                    )
                values.append(
                    jpamb.case.String(value)
                )

            case _:
                raise NotImplementedError(
                    f"Unsupported input type: {param!r}"
                )

    return jpamb.case.Input(values)


def analyse():
    """
    Dynamic analysis using systematic and random inputs.
    """

    methodid = jpamb.getmethodid(
        "dynamic",
        "1.0",
        "best analyzers",
        ["dynamic", "python", "smallcheck", "fuzzing"],
        for_science=True,
    )

    suite, eff = jpamb.setup()

    bc = jpamb.Bytecode(suite, eff, {})

    # Maximum instructions executed for one input
    MAX_STEPS = 200

    # Number of different inputs to try
    MAX_TESTS = 100

    # Deterministic randomness
    rand = random.Random(0)

    # Store all observed outcomes
    behaviors = set()

    # Generate and test different inputs
    for trial in range(MAX_TESTS):

        test_input = fuzz_input(
            rand,
            methodid,
            trial
        )

        state = initial(
            bc,
            methodid,
            test_input
        )

        # Run the interpreter on this input
        for step_number in range(MAX_STEPS):
            pc, state = step(bc, state)

            # The program terminated normally or with an error.
            if isinstance(state, str):
                behaviors.add(state)
                break

            # Detect an unconditional jump to itself.
            if isinstance(bc[pc], jvm.Goto):
                new_pc = state.frames.peek().pc
                if new_pc.offset == pc.offset:
                    behaviors.add("*")
                    break

    # Report the behaviors we actually observed
    for query in jpamb.QUERIES:
        if query in behaviors:
            print(f"{query};found")
        else:
            print(f"{query};not-found")