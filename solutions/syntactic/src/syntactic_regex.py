#!/usr/bin/env python3

"""A simple regex-based syntactic analysis for Java program behavior."""

# Standard Python libraries
import logging          # Used to print debug information
import re               # Regular expressions -> search for text patterns
import sys              # Used to exit the program if something goes wrong
from pathlib import Path  # Used for file paths

# JPAMB library provided by the course
import jpamb


def main():

    # ============================================================
    # 1. GET THE JAVA METHOD THAT JPAMB WANTS US TO ANALYZE
    # ============================================================

    # JPAMB tells this analyzer which specific Java method
    # it should inspect.
    #
    # For example, it could ask us to analyze something like:
    #
    #   Simple.assertFalse()
    #
    # absmethodid will contain information such as:
    #   - the class name
    #   - the method name
    #   - the method signature
    absmethodid = jpamb.getmethodid(
        "syntaxer",
        "1.0",
        "The Rice Theorem Cookers",
        ["syntactic", "python"],
        for_science=True,
    )


    # ============================================================
    # 2. SET UP DEBUG LOGGING
    # ============================================================

    # This has nothing to do with the actual analysis.
    # It is only useful so we can see what the program is doing.
    log = logging
    log.basicConfig(level=logging.DEBUG)

    # Print the current working directory in debug mode
    log.debug(Path.cwd())


    # ============================================================
    # 3. LOAD THE JPAMB BENCHMARK
    # ============================================================

    # jpamb.setup() gives us access to the benchmark suite
    # and all the Java source files.
    suite, _ = jpamb.setup()


    # ============================================================
    # 4. FIND THE JAVA SOURCE FILE
    # ============================================================

    # Based on the class name, JPAMB finds the corresponding .java file.
    #
    # Example:
    #   class -> jpamb.cases.Simple
    #   file  -> cases/jpamb/cases/Simple.java
    srcfile = suite.sourcefile(absmethodid.classname).relative_to(Path.cwd())


    # ============================================================
    # 5. READ THE WHOLE JAVA FILE AS TEXT
    # ============================================================

    with open(srcfile, "r") as f:
        log.debug("parse sourcefile %s", srcfile)

        # content is now one big Python string containing
        # the whole Java file.
        content = f.read()


    # ============================================================
    # 6. FIND THE SPECIFIC METHOD INSIDE THE JAVA FILE
    # ============================================================

    # This regex searches for a line containing the method name.
    #
    # If the method name were "assertFalse",
    # it would approximately search for:
    #
    #   ... assertFalse(...)
    #
    # NOTE:
    # This is still purely syntactic:
    # we are just searching text.
    res = re.search(
        rf".* {absmethodid.methodid.name}\(.*\)",
        content
    )


    # If the method cannot be found, stop the analyzer.
    if not res:
        log.error("Could not find method")
        sys.exit(1)


    log.debug(f"found {res}")


    # ============================================================
    # 7. TAKE EVERYTHING AFTER THE METHOD DECLARATION
    # ============================================================

    # res.end(0) = position where the method declaration ends.
    #
    # So "rest" contains everything after that point.
    #
    # Example:
    #
    # public static void foo() {
    #                         ^ res.end()
    #
    #     assert false;
    # }
    #
    # rest would contain roughly:
    #
    # {
    #     assert false;
    # }
    #
    # plus potentially later methods in the same file.
    rest = content[res.end(0) : -1]


    # ============================================================
    # 8-10. ASSERTION ERROR
    # ============================================================

    assertion = re.search(
        r"assert\s+false|assert\s+true|assert|(^\s*})",
        rest,
        re.MULTILINE
    )

    assertion_match = assertion.group(0).strip()

    if assertion_match.startswith("assert false"):
        print("assertion error;assert-false")

    elif assertion_match.startswith("assert true"):
        print("assertion error;assert-true")

    elif assertion_match == "assert":
        print("assertion error;assert-other")

    else:
        print("assertion error;no-assert")


    # ============================================================
    # 11. DIVIDE BY ZERO
    # ============================================================

    division = re.search(
        r"/\s*0\b|/\s*[1-9][0-9]*\b|/|(^\s*})",
        rest,
        re.MULTILINE
    )

    division_match = division.group(0).strip()

    if re.match(r"/\s*0\b", division_match):
        print("divide by zero;divide-literal-zero")

    elif re.match(r"/\s*[1-9][0-9]*\b", division_match):
        print("divide by zero;divide-nonzero-constant")

    elif division_match == "/":
        print("divide by zero;divide-expression")

    else:
        print("divide by zero;no-division")


    # ============================================================
    # 12. NON-TERMINATION / INFINITE LOOP
    # ============================================================

    loop_or_end = re.search(
        r"while\s*\(\s*true\s*\)|(^\s*})",
        rest,
        re.MULTILINE
    )

    loop_found = not loop_or_end.group(0).strip().startswith("}")

    if loop_found:
        print("*;while-true")
    else:
        print("*;no-while-true")


    # ============================================================
    # 13. NULL POINTER
    # ============================================================

    null_or_end = re.search(r"\bnull\b|(^\s*})", rest, re.MULTILINE)
    null_found = null_or_end.group(0) == "null"

    if null_found:
        print("null pointer;null-found")
    else:
        print("null pointer;no-null")


    # ============================================================
    # 14. OUT OF BOUNDS
    # ============================================================

    array = re.search(
        r"\[[0-9]+\]|\[[a-zA-Z_][a-zA-Z0-9_]*\]|(^\s*})",
        rest,
        re.MULTILINE
    )

    array_match = array.group(0).strip()

    if re.match(r"\[[0-9]+\]", array_match):
        print("out of bounds;constant-index")

    elif re.match(r"\[[a-zA-Z_][a-zA-Z0-9_]*\]", array_match):
        print("out of bounds;variable-index")

    else:
        print("out of bounds;no-array-access")


    # ============================================================
    # 15. BEHAVIORS WE ARE NOT ANALYZING YET
    # ============================================================

    for q in jpamb.QUERIES:
        if q not in [
            "assertion error",
            "divide by zero",
            "null pointer",
            "out of bounds",
            "*",
        ]:
            print(f"{q};skip")