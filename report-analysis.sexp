(analysis-summary
  :config (analysis-config
    :cmd (dynamic-analysis)
    :analysis (analysis-info
      :name dynamic
      :version 1.0
      :group "bests analyzers"
      :tags (dynamic python smallcheck fuzzing random dictionary syntatic)
      :system macOS-26.6.2-arm64-arm-64bit-Mach-O
    )
    :experiments (
      :"jpamb.cases.Arrays.arrayContent:()V" ()
      :"jpamb.cases.Arrays.arrayContentAboveMinus13:()V" ()
      :"jpamb.cases.Arrays.arrayInBounds:()V" ()
      :"jpamb.cases.Arrays.arrayIsNull:()V" ()
      :"jpamb.cases.Arrays.arrayIsNullLength:()V" ()
      :"jpamb.cases.Arrays.arrayLength:()V" ()
      :"jpamb.cases.Arrays.arrayNotEmpty:([I)V" ()
      :"jpamb.cases.Arrays.arrayOutOfBounds:()V" ()
      :"jpamb.cases.Arrays.arraySometimesNull:(I)V" ()
      :"jpamb.cases.Arrays.arraySpellsHello:([C)V" ()
      :"jpamb.cases.Arrays.arraySumIsLarge:([I)V" ()
      :"jpamb.cases.Arrays.binarySearch:(I)V" ()
      :"jpamb.cases.Calls.allPrimesArePositive:(I)V" ()
      :"jpamb.cases.Calls.callsAssertFalse:()V" ()
      :"jpamb.cases.Calls.callsAssertFib:(I)V" ()
      :"jpamb.cases.Calls.callsAssertIf:(Z)V" ()
      :"jpamb.cases.Calls.callsAssertIfWithTrue:()V" ()
      :"jpamb.cases.Calls.callsAssertTrue:()V" ()
      :"jpamb.cases.Dependent.badNormalizedDistance:(II)I" ()
      :"jpamb.cases.Dependent.divisionLoop:(I)V" ()
      :"jpamb.cases.Dependent.normalizedDistance:(II)I" ()
      :"jpamb.cases.Dependent.safeDivByN:(I)I" ()
      :"jpamb.cases.Loops.forever:()V" ()
      :"jpamb.cases.Loops.neverAsserts:()V" ()
      :"jpamb.cases.Loops.neverDivides:()I" ()
      :"jpamb.cases.Loops.terminates:()V" ()
      :"jpamb.cases.Simple.assertBoolean:(Z)V" ()
      :"jpamb.cases.Simple.assertFalse:()V" ()
      :"jpamb.cases.Simple.assertInteger:(I)V" ()
      :"jpamb.cases.Simple.assertPositive:(I)V" ()
      :"jpamb.cases.Simple.assertTrue:()V" ()
      :"jpamb.cases.Simple.checkBeforeAssert:(I)V" ()
      :"jpamb.cases.Simple.checkBeforeDivideByN2:(I)I" ()
      :"jpamb.cases.Simple.checkBeforeDivideByN:(I)I" ()
      :"jpamb.cases.Simple.divideByN:(I)I" ()
      :"jpamb.cases.Simple.divideByNMinus10054203:(I)I" ()
      :"jpamb.cases.Simple.divideByZero:()I" ()
      :"jpamb.cases.Simple.divideZeroByZero:(II)I" ()
      :"jpamb.cases.Simple.doNothing:()V" ()
      :"jpamb.cases.Simple.earlyReturn:()I" ()
      :"jpamb.cases.Simple.justAdd:(II)I" ()
      :"jpamb.cases.Simple.justMulitply:(II)I" ()
      :"jpamb.cases.Simple.justReturn:()I" ()
      :"jpamb.cases.Simple.justReturnNothing:()V" ()
      :"jpamb.cases.Simple.multiError:(Z)I" ()
      :"jpamb.cases.Strings.sayHello:(Ljava/lang/String;)V" ()
      :"jpamb.cases.Tricky.collatz:(I)V" ()
    )
    :iterations 3
    :timeout 5.0
  )
  :results (
    :"jpamb.cases.Arrays.arrayContent:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 146399250
          :relative 1.5783963765230935
        )
        :calibrates (3789625 3940250)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 157843292
          :relative 1.6205021940666275
        )
        :calibrates (3784792 3779250)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 147520459
          :relative 1.5907099030453697
        )
        :calibrates (3725083 3846250)
      ))
    :"jpamb.cases.Arrays.arrayContentAboveMinus13:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 172331792
          :relative 1.6490122902279842
        )
        :calibrates (3883750 3849875)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 167356208
          :relative 1.6494199747141793
        )
        :calibrates (3679500 3823792)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 162337750
          :relative 1.6349935737674972
        )
        :calibrates (3729958 3794166)
      ))
    :"jpamb.cases.Arrays.arrayInBounds:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 120496125
          :relative 1.506524569696264
        )
        :calibrates (3669542 3837667)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 108593291
          :relative 1.457911609767412
        )
        :calibrates (3779917 3787042)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 110882125
          :relative 1.4724885598103639
        )
        :calibrates (3670583 3800834)
      ))
    :"jpamb.cases.Arrays.arrayIsNull:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 115702625
          :relative 1.4907063549278556
        )
        :calibrates (3669083 3806875)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 109029250
          :relative 1.4640332812014762
        )
        :calibrates (3675583 3815416)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 104488334
          :relative 1.442030988478766
        )
        :calibrates (3676667 3875417)
      ))
    :"jpamb.cases.Arrays.arrayIsNullLength:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 113796750
          :relative 1.4769657449805937
        )
        :calibrates (3669042 3920125)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 109255791
          :relative 1.4649081122462835
        )
        :calibrates (3675375 3816083)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 105786667
          :relative 1.4477465461440846
        )
        :calibrates (3731541 3814417)
      ))
    :"jpamb.cases.Arrays.arrayLength:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 123318709
          :relative 1.499869273560686
        )
        :calibrates (4027875 3773833)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 115603375
          :relative 1.491230129383397
        )
        :calibrates (3677542 3783000)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 117066708
          :relative 1.4941247993827815
        )
        :calibrates (3675541 3829250)
      ))
    :"jpamb.cases.Arrays.arrayNotEmpty:([I)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 116601500
          :relative 1.4815560431799506
        )
        :calibrates (3849959 3844500)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 106046042
          :relative 1.4540379570224853
        )
        :calibrates (3674917 3780750)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 105932708
          :relative 1.4441098293217975
        )
        :calibrates (3751750 3868167)
      ))
    :"jpamb.cases.Arrays.arrayOutOfBounds:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" found
          )
        )
        :duration (duration
          :absolute 121684875
          :relative 1.5042949827025702
        )
        :calibrates (3775250 3845042)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" found
          )
        )
        :duration (duration
          :absolute 112747542
          :relative 1.478722932314347
        )
        :calibrates (3700833 3788000)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" found
          )
        )
        :duration (duration
          :absolute 112752333
          :relative 1.4695982269172756
        )
        :calibrates (3818500 3829666)
      ))
    :"jpamb.cases.Arrays.arraySometimesNull:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" found
            :ok not-found
            :"out of bounds" found
          )
        )
        :duration (duration
          :absolute 119789750
          :relative 1.5041351262329048
        )
        :calibrates (3720500 3783875)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" found
            :ok not-found
            :"out of bounds" found
          )
        )
        :duration (duration
          :absolute 111072875
          :relative 1.4732180597931264
        )
        :calibrates (3674042 3797667)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" found
            :ok not-found
            :"out of bounds" found
          )
        )
        :duration (duration
          :absolute 114408625
          :relative 1.4805817869810087
        )
        :calibrates (3746083 3820625)
      ))
    :"jpamb.cases.Arrays.arraySpellsHello:([C)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" found
          )
        )
        :duration (duration
          :absolute 112944333
          :relative 1.4786088497441017
        )
        :calibrates (3741000 3762875)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" found
          )
        )
        :duration (duration
          :absolute 108951292
          :relative 1.4631142667589567
        )
        :calibrates (3676583 3824917)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" found
          )
        )
        :duration (duration
          :absolute 111080833
          :relative 1.4697804352095158
        )
        :calibrates (3690000 3841625)
      ))
    :"jpamb.cases.Arrays.arraySumIsLarge:([I)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 141984917
          :relative 1.5771362091693226
        )
        :calibrates (3690583 3828000)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 123407417
          :relative 1.5212338859915602
        )
        :calibrates (3665917 3766625)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 128016875
          :relative 1.5291702439747643
        )
        :calibrates (3745792 3824750)
      ))
    :"jpamb.cases.Arrays.binarySearch:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 188015500
          :relative 1.702290771992698
        )
        :calibrates (3681334 3782000)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 171335708
          :relative 1.6559278025298365
        )
        :calibrates (3784375 3783084)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 176239167
          :relative 1.668598682925209
        )
        :calibrates (3742958 3817250)
      ))
    :"jpamb.cases.Calls.callsAssertFalse:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 115998000
          :relative 1.4879555624489538
        )
        :calibrates (3752417 3790250)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 109020542
          :relative 1.456345931938671
        )
        :calibrates (3811000 3813167)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 110050000
          :relative 1.4665033373586858
        )
        :calibrates (3751666 3766583)
      ))
    :"jpamb.cases.Calls.callsAssertFib:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 197155375
          :relative 1.7058580409839486
        )
        :calibrates (3744666 4017458)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 188759708
          :relative 1.6962424039759192
        )
        :calibrates (3707708 3890250)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 187753833
          :relative 1.700352044963783
        )
        :calibrates (3696250 3790042)
      ))
    :"jpamb.cases.Calls.callsAssertIf:(Z)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 114407375
          :relative 1.4878332771159777
        )
        :calibrates (3675750 3765583)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 107203917
          :relative 1.4538405052109256
        )
        :calibrates (3723583 3816917)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 108343000
          :relative 1.460861263997065
        )
        :calibrates (3674125 3824292)
      ))
    :"jpamb.cases.Calls.callsAssertIfWithTrue:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 112293000
          :relative 1.477991852760855
        )
        :calibrates (3662833 3808375)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 107269416
          :relative 1.4592088223146582
        )
        :calibrates (3671000 3781416)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 107314208
          :relative 1.460484117947669
        )
        :calibrates (3665542 3768125)
      ))
    :"jpamb.cases.Calls.callsAssertTrue:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 105341500
          :relative 1.4485368465510595
        )
        :calibrates (3668333 3832209)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 107378000
          :relative 1.4519061912103237
        )
        :calibrates (3692209 3894250)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 105255875
          :relative 1.4496869324848014
        )
        :calibrates (3671208 3803417)
      ))
    :"jpamb.cases.Dependent.divisionLoop:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 148936166
          :relative 1.5959321861440197
        )
        :calibrates (3763417 3789209)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 145377916
          :relative 1.5787354487977487
        )
        :calibrates (3827791 3842167)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 150872250
          :relative 1.5965578281171438
        )
        :calibrates (3803083 3836709)
      ))
    :"jpamb.cases.Dependent.safeDivByN:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 110594625
          :relative 1.4645102814718427
        )
        :calibrates (3792542 3797667)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 105304958
          :relative 1.436422014736033
        )
        :calibrates (3867459 3842584)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 108948541
          :relative 1.44889838408948
        )
        :calibrates (3867458 3883458)
      ))
    :"jpamb.cases.Loops.forever:()V" ((analysis-result
        :response (response
          :predictions (
            :* found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 103717458
          :relative 1.4388965999251646
        )
        :calibrates (3674250 3876416)
      ) (analysis-result
        :response (response
          :predictions (
            :* found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 101782125
          :relative 1.4308600092845785
        )
        :calibrates (3732125 3816042)
      ) (analysis-result
        :response (response
          :predictions (
            :* found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 100267458
          :relative 1.4246314414184835
        )
        :calibrates (3675959 3867292)
      ))
    :"jpamb.cases.Loops.neverAsserts:()V" ((analysis-result
        :response (response
          :predictions (
            :* found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 208102250
          :relative 1.7440959049427032
        )
        :calibrates (3679709 3822875)
      ) (analysis-result
        :response (response
          :predictions (
            :* found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 204978000
          :relative 1.7396759620981395
        )
        :calibrates (3673708 3791833)
      ) (analysis-result
        :response (response
          :predictions (
            :* found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 211985625
          :relative 1.7515928536622
        )
        :calibrates (3738125 3773667)
      ))
    :"jpamb.cases.Loops.neverDivides:()I" ((analysis-result
        :response (response
          :predictions (
            :* found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 213938416
          :relative 1.7581581382420557
        )
        :calibrates (3695708 3771541)
      ) (analysis-result
        :response (response
          :predictions (
            :* found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 209935583
          :relative 1.748907362417604
        )
        :calibrates (3673958 3811333)
      ) (analysis-result
        :response (response
          :predictions (
            :* found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 212769375
          :relative 1.7478493749109638
        )
        :calibrates (3739500 3865334)
      ))
    :"jpamb.cases.Loops.terminates:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 107230917
          :relative 1.457078438030131
        )
        :calibrates (3666792 3819583)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 108243292
          :relative 1.4615317702726889
        )
        :calibrates (3673209 3806750)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 108658583
          :relative 1.4665462255012214
        )
        :calibrates (3666959 3755500)
      ))
    :"jpamb.cases.Simple.assertBoolean:(Z)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 102841834
          :relative 1.4420210690394775
        )
        :calibrates (3671500 3761750)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 104430125
          :relative 1.441801000678104
        )
        :calibrates (3672500 3879375)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 109233875
          :relative 1.46384861113632
        )
        :calibrates (3730208 3778042)
      ))
    :"jpamb.cases.Simple.assertFalse:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 103058209
          :relative 1.434345475070032
        )
        :calibrates (3769042 3812667)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 99525625
          :relative 1.4223863266954837
        )
        :calibrates (3725166 3801083)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 103976833
          :relative 1.444420750882508
        )
        :calibrates (3672791 3801084)
      ))
    :"jpamb.cases.Simple.assertInteger:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 104366417
          :relative 1.4477649778780848
        )
        :calibrates (3672375 3771958)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 105336916
          :relative 1.4470655973219162
        )
        :calibrates (3677667 3848000)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 111329250
          :relative 1.4690432691415334
        )
        :calibrates (3794125 3767167)
      ))
    :"jpamb.cases.Simple.assertPositive:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 106481792
          :relative 1.4511164546597506
        )
        :calibrates (3673917 3862916)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 103470250
          :relative 1.4347105856264544
        )
        :calibrates (3742875 3862750)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 105180458
          :relative 1.4502966151278063
        )
        :calibrates (3670291 3788500)
      ))
    :"jpamb.cases.Simple.assertTrue:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 99151625
          :relative 1.4219212718564282
        )
        :calibrates (3668083 3837917)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 98430333
          :relative 1.4174577061976381
        )
        :calibrates (3727875 3800500)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 103360875
          :relative 1.4413200619501698
        )
        :calibrates (3670292 3812542)
      ))
    :"jpamb.cases.Simple.checkBeforeAssert:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 105486917
          :relative 1.4504213564455946
        )
        :calibrates (3691625 3786750)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 111763750
          :relative 1.4742793678683797
        )
        :calibrates (3673875 3825958)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 108506000
          :relative 1.4597127668269787
        )
        :calibrates (3707042 3822542)
      ))
    :"jpamb.cases.Simple.checkBeforeDivideByN2:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 104671167
          :relative 1.441522242746245
        )
        :calibrates (3675333 3898833)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 107160417
          :relative 1.453587479075863
        )
        :calibrates (3729458 3812375)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 104018000
          :relative 1.4426527568282672
        )
        :calibrates (3755000 3752334)
      ))
    :"jpamb.cases.Simple.checkBeforeDivideByN:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 106335791
          :relative 1.454905087456624
        )
        :calibrates (3681542 3779584)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 112755542
          :relative 1.4782899980545219
        )
        :calibrates (3674417 3822417)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 109395542
          :relative 1.4581887086832224
        )
        :calibrates (3739666 3878333)
      ))
    :"jpamb.cases.Simple.divideByN:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 102758167
          :relative 1.4406876815644583
        )
        :calibrates (3686208 3763833)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 104324792
          :relative 1.4432959657046283
        )
        :calibrates (3711125 3807208)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 105933250
          :relative 1.4488685595268567
        )
        :calibrates (3675958 3860959)
      ))
    :"jpamb.cases.Simple.divideByNMinus10054203:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 106206208
          :relative 1.447575154460948
        )
        :calibrates (3797375 3781500)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 110530292
          :relative 1.465824390621256
        )
        :calibrates (3692250 3870625)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 108616833
          :relative 1.4643872167034082
        )
        :calibrates (3676209 3780375)
      ))
    :"jpamb.cases.Simple.divideByZero:()I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 101358875
          :relative 1.434373704320941
        )
        :calibrates (3678959 3777250)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 101129000
          :relative 1.4259406187817456
        )
        :calibrates (3731833 3853333)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 104423500
          :relative 1.445372980624248
        )
        :calibrates (3676875 3812667)
      ))
    :"jpamb.cases.Simple.divideZeroByZero:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 109203666
          :relative 1.4603602388496464
        )
        :calibrates (3692750 3873958)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 106231584
          :relative 1.4533384535706175
        )
        :calibrates (3677084 3803667)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 107950083
          :relative 1.4540708269595055
        )
        :calibrates (3720208 3868750)
      ))
    :"jpamb.cases.Simple.doNothing:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 116935667
          :relative 1.48677035185089
        )
        :calibrates (3734167 3890250)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 100069709
          :relative 1.4275713321237007
        )
        :calibrates (3716042 3761542)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 101584250
          :relative 1.4315133454773803
        )
        :calibrates (3667834 3854334)
      ))
    :"jpamb.cases.Simple.earlyReturn:()I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 111619750
          :relative 1.4721996139765243
        )
        :calibrates (3741375 3784750)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 101266166
          :relative 1.4284443436708372
        )
        :calibrates (3678125 3873667)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 101815333
          :relative 1.4284679336703348
        )
        :calibrates (3726333 3866000)
      ))
    :"jpamb.cases.Simple.justAdd:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 114450042
          :relative 1.4659304506406206
        )
        :calibrates (3871583 3957583)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 104344125
          :relative 1.4385820149250688
        )
        :calibrates (3720167 3881625)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 102571250
          :relative 1.4380572694403746
        )
        :calibrates (3688667 3793000)
      ))
    :"jpamb.cases.Simple.justMulitply:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 115241209
          :relative 1.4888910792901224
        )
        :calibrates (3682416 3794917)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 103123834
          :relative 1.4382650632001857
        )
        :calibrates (3730125 3788250)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 106499833
          :relative 1.452539001570492
        )
        :calibrates (3758167 3755292)
      ))
    :"jpamb.cases.Simple.justReturn:()I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 110851292
          :relative 1.4720312929944717
        )
        :calibrates (3674333 3802875)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 104007208
          :relative 1.4427981777511507
        )
        :calibrates (3694958 3809084)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 100347417
          :relative 1.4229792430037587
        )
        :calibrates (3719333 3858708)
      ))
    :"jpamb.cases.Simple.justReturnNothing:()V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 109889791
          :relative 1.4614524172181316
        )
        :calibrates (3687792 3907333)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 99845833
          :relative 1.4204759323029845
        )
        :calibrates (3678000 3905750)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" not-found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 99346875
          :relative 1.426129961116781
        )
        :calibrates (3669209 3779041)
      ))
    :"jpamb.cases.Simple.multiError:(Z)I" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 112237875
          :relative 1.4762722463649933
        )
        :calibrates (3696209 3800958)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 105628250
          :relative 1.4484190185040988
        )
        :calibrates (3727833 3795167)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" found
            :"null pointer" not-found
            :ok not-found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 105608541
          :relative 1.4474872514894608
        )
        :calibrates (3780584 3757167)
      ))
    :"jpamb.cases.Strings.sayHello:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 112381708
          :relative 1.4657428126137
        )
        :calibrates (3761542 3929458)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 108577125
          :relative 1.4639325283095486
        )
        :calibrates (3675875 3785791)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 109185625
          :relative 1.4635917254434831
        )
        :calibrates (3692416 3816958)
      ))
    :"jpamb.cases.Tricky.collatz:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 180867625
          :relative 1.674705666917343
        )
        :calibrates (3696959 3953459)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 153439750
          :relative 1.6041825569652368
        )
        :calibrates (3754708 3879875)
      ) (analysis-result
        :response (response
          :predictions (
            :* not-found
            :"assertion error" found
            :"divide by zero" not-found
            :"null pointer" not-found
            :ok found
            :"out of bounds" not-found
          )
        )
        :duration (duration
          :absolute 150493916
          :relative 1.6035045842456177
        )
        :calibrates (3677833 3821875)
      ))
  )
)