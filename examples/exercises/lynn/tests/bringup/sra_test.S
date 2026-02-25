// sra/srai_test
// Ellen Yu
// ellyu@hmc.edu
// 2/8/2026

.extern return_sra_test
.extern fail

    .section .text.init
    .globl sra_test
    .type  sra_test, @function

sra_test:
    test1_sra:
        li   t0, 0x80000000
        li   t1, 4
        sra  t2, t0, t1
        li   t3, 0xf8000000
        beq  t2, t3, test2_sra
        j Fail_sra_1

    test2_sra:
        li   t0, 0xffffffff
        li   t1, 0b10
        sra  t2, t0, t1
        li   t3, 0xffffffff
        beq  t2, t3, test3_sra
        j Fail_sra_2

    test3_sra:
        li   t0, 0x12345678
        li   t1, 8
        sra  t2, t0, t1
        li   t3, 0x00123456
        beq  t2, t3, test4_sra
        j Fail_sra_3

    test4_sra:
        li   t0, 0xabcdef00
        li   t1, 12
        sra  t2, t0, t1
        li   t3, 0xfffabcde
        beq  t2, t3, test5_sra
        j Fail_sra_4

    test5_sra:
        li   t0, 0xffff0000
        li   t1, 16
        sra  t2, t0, t1
        li   t3, 0xffffffff
        beq  t2, t3, test6_sra
        j Fail_sra_5

    test6_sra:
        li   t0, 0x12345678
        li   t1, 0
        sra  t2, t0, t1
        li   t3, 0x12345678
        beq  t2, t3, test7_sra
        j Fail_sra_6

    test7_sra:
        li   t0, 0xaaaaaaaa
        li   t1, 1
        sra  t2, t0, t1
        li   t3, 0xd5555555
        beq  t2, t3, test8_sra
        j Fail_sra_7

    test8_sra:
        li   t0, 0x80000001
        li   t1, 31
        sra  t2, t0, t1
        li   t3, 0xffffffff
        beq  t2, t3, test9_sra
        j Fail_sra_8

    test9_sra:
        li   t0, 0x7edcba98
        li   t1, 20
        sra  t2, t0, t1
        li   t3, 0x000007ed
        beq  t2, t3, test10_sra
        j Fail_sra_9

    test10_sra:
        li   t0, 0x00000001
        li   t1, 1
        sra  t2, t0, t1
        li   t3, 0x00000000
        beq  t2, t3, test1_srai
        j Fail_sra_10

    test1_srai:
        li   t0, 0x80000000
        srai t2, t0, 4
        li   t3, 0xf8000000
        beq  t2, t3, test2_srai
        j Fail_srai_1

    test2_srai:
        li   t0, 0xffffffff
        srai t2, t0, 0b10
        li   t3, 0xffffffff
        beq  t2, t3, test3_srai
        j Fail_srai_2

    test3_srai:
        li   t0, 0x12345678
        srai t2, t0, 8
        li   t3, 0x00123456
        beq  t2, t3, test4_srai
        j Fail_srai_3

    test4_srai:
        li   t0, 0xabcdef00
        srai t2, t0, 12
        li   t3, 0xfffabcde
        beq  t2, t3, test5_srai
        j Fail_srai_4

    test5_srai:
        li   t0, 0xffff0000
        srai t2, t0, 16
        li   t3, 0xffffffff
        beq  t2, t3, test6_srai
        j Fail_srai_5

    test6_srai:
        li   t0, 0x12345678
        srai t2, t0, 0
        li   t3, 0x12345678
        beq  t2, t3, test7_srai
        j Fail_srai_6

    test7_srai:
        li   t0, 0xaaaaaaaa
        srai t2, t0, 1
        li   t3, 0xd5555555
        beq  t2, t3, test8_srai
        j Fail_srai_7

    test8_srai:
        li   t0, 0x80000001
        srai t2, t0, 31
        li   t3, 0xffffffff
        beq  t2, t3, test9_srai
        j Fail_srai_8

    test9_srai:
        li   t0, 0x7edcba98
        srai t2, t0, 20
        li   t3, 0x000007ed
        beq  t2, t3, test10_srai
        j Fail_srai_9

    test10_srai:
        li   t0, 0x00000001
        srai t2, t0, 1
        li   t3, 0x00000000
        beq  t2, t3, pass
        j Fail_srai_10

    pass:
        j return_sra_test

Fail_sra_1:
    li   gp, 301
    j    fail

Fail_sra_2:
    li   gp, 302
    j    fail

Fail_sra_3:
    li   gp, 303
    j    fail

Fail_sra_4:
    li   gp, 304
    j    fail

Fail_sra_5:
    li   gp, 305
    j    fail

Fail_sra_6:
    li   gp, 306
    j    fail

Fail_sra_7:
    li   gp, 307
    j    fail

Fail_sra_8:
    li   gp, 308
    j    fail

Fail_sra_9:
    li   gp, 309
    j    fail

Fail_sra_10:
    li   gp, 310
    j    fail

Fail_srai_1:
    li   gp, 311
    j    fail

Fail_srai_2:
    li   gp, 312
    j    fail

Fail_srai_3:
    li   gp, 313
    j    fail

Fail_srai_4:
    li   gp, 314
    j    fail

Fail_srai_5:
    li   gp, 315
    j    fail

Fail_srai_6:
    li   gp, 316
    j    fail

Fail_srai_7:
    li   gp, 317
    j    fail

Fail_srai_8:
    li   gp, 318
    j    fail

Fail_srai_9:
    li   gp, 319
    j    fail

Fail_srai_10:
    li   gp, 320
    j    fail
