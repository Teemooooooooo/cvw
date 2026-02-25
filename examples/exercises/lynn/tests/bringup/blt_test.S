.extern return_blt_test
.extern fail

    .section .text.init
    .globl blt_test
    .type  blt_test, @function

blt_test:
    test1_blt:
        li   t0, 0x00000001
        li   t1, 0x00000002
        blt  t0, t1, test2_blt
        j Fail_blt_1

    test2_blt:
        li   t0, 0x00000002
        li   t1, 0x00000001
        blt  t0, t1, Fail_blt_2
        j test3_blt

    test3_blt:
        li   t0, 0xffffffff
        li   t1, 0x00000000
        blt  t0, t1, test4_blt
        j Fail_blt_3

    test4_blt:
        li   t0, 0x00000000
        li   t1, 0xffffffff
        blt  t0, t1, Fail_blt_4
        j test5_blt

    test5_blt:
        li   t0, 0x00000001
        li   t1, 0x00000001
        blt  t0, t1, Fail_blt_5
        j test6_blt

    test6_blt:
        li   t0, 0x80000000
        li   t1, 0x7fffffff
        blt  t0, t1, test7_blt
        j Fail_blt_6

    test7_blt:
        li   t0, 0x7fffffff
        li   t1, 0x80000000
        blt  t0, t1, Fail_blt_7
        j test8_blt

    test8_blt:
        li   t0, 0xfffffffe
        li   t1, 0xffffffff
        blt  t0, t1, test9_blt
        j Fail_blt_8

    test9_blt:
        li   t0, 0x12345678
        li   t1, 0x12345679
        blt  t0, t1, test10_blt
        j Fail_blt_9

    test10_blt:
       li   t0, -1
    li   t1, 0x00000001
    blt  t0, t1, test1_bltu
    j Fail_blt_10

    test1_bltu:
        li   t0, 0x00000001
        li   t1, 0x00000002
        bltu t0, t1, test2_bltu
        j Fail_bltu_1

    test2_bltu:
        li   t0, 0x00000002
        li   t1, 0x00000001
        bltu t0, t1, Fail_bltu_2
        j test3_bltu

    test3_bltu:
        li   t0, 0xffffffff
        li   t1, 0x00000001
        bltu t0, t1, Fail_bltu_3
        j test4_bltu

    test4_bltu:
        li   t0, 0x00000001
        li   t1, 0xffffffff
        bltu t0, t1, test5_bltu
        j Fail_bltu_4

    test5_bltu:
        li   t0, 0x00000001
        li   t1, 0x00000001
        bltu t0, t1, Fail_bltu_5
        j test6_bltu

    test6_bltu:
        li   t0, 0x80000000
        li   t1, 0x7fffffff
        bltu t0, t1, Fail_bltu_6
        j test7_bltu

    test7_bltu:
        li   t0, 0x7fffffff
        li   t1, 0x80000000
        bltu t0, t1, test8_bltu
        j Fail_bltu_7

    test8_bltu:
        li   t0, 0xfffffffe
        li   t1, 0xffffffff
        bltu t0, t1, test9_bltu
        j Fail_bltu_8

    test9_bltu:
        li   t0, 0x12345678
        li   t1, 0x12345679
        bltu t0, t1, test10_bltu
        j Fail_bltu_9

    test10_bltu:
        li   t0, 0xabcdef00
        li   t1, 0x00000001
        bltu t0, t1, Fail_bltu_10
        j pass

    pass:
        j return_blt_test

Fail_blt_1:
    li   gp, 1001
    j    fail

Fail_blt_2:
    li   gp, 1002
    j    fail

Fail_blt_3:
    li   gp, 1003
    j    fail

Fail_blt_4:
    li   gp, 1004
    j    fail

Fail_blt_5:
    li   gp, 1005
    j    fail

Fail_blt_6:
    li   gp, 1006
    j    fail

Fail_blt_7:
    li   gp, 1007
    j    fail

Fail_blt_8:
    li   gp, 1008
    j    fail

Fail_blt_9:
    li   gp, 1009
    j    fail

Fail_blt_10:
    li   gp, 1010
    j    fail

Fail_bltu_1:
    li   gp, 1011
    j    fail

Fail_bltu_2:
    li   gp, 1012
    j    fail

Fail_bltu_3:
    li   gp, 1013
    j    fail

Fail_bltu_4:
    li   gp, 1014
    j    fail

Fail_bltu_5:
    li   gp, 1015
    j    fail

Fail_bltu_6:
    li   gp, 1016
    j    fail

Fail_bltu_7:
    li   gp, 1017
    j    fail

Fail_bltu_8:
    li   gp, 1018
    j    fail

Fail_bltu_9:
    li   gp, 1019
    j    fail

Fail_bltu_10:
    li   gp, 1020
    j    fail
