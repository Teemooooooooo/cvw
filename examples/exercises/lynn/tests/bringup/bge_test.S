.extern return_bge_test
.extern fail

    .section .text.init
    .globl bge_test
    .type  bge_test, @function

bge_test:
    test1_bge:
        li   t0, 0x00000002
        li   t1, 0x00000001
        bge  t0, t1, test2_bge
        j Fail_bge_1

    test2_bge:
        li   t0, 0x00000001
        li   t1, 0x00000002
        bge  t0, t1, Fail_bge_2
        j test3_bge

    test3_bge:
        li   t0, 0x00000001
        li   t1, 0x00000001
        bge  t0, t1, test4_bge
        j Fail_bge_3

    test4_bge:
        li   t0, 0x00000000
        li   t1, 0xffffffff
        bge  t0, t1, test5_bge
        j Fail_bge_4

    test5_bge:
        li   t0, 0xffffffff
        li   t1, 0x00000000
        bge  t0, t1, Fail_bge_5
        j test6_bge

    test6_bge:
        li   t0, 0x7fffffff
        li   t1, 0x80000000
        bge  t0, t1, test7_bge
        j Fail_bge_6

    test7_bge:
        li   t0, 0x80000000
        li   t1, 0x7fffffff
        bge  t0, t1, Fail_bge_7
        j test8_bge

    test8_bge:
        li   t0, 0xffffffff
        li   t1, 0xfffffffe
        bge  t0, t1, test9_bge
        j Fail_bge_8

    test9_bge:
        li   t0, 0x12345679
        li   t1, 0x12345678
        bge  t0, t1, test10_bge
        j Fail_bge_9

    test10_bge:
        li   t0, 0x00000001
        li   t1, 0xabcdef00
        bge  t0, t1, test1_bgeu
        j Fail_bge_10

    test1_bgeu:
        li   t0, 0x00000002
        li   t1, 0x00000001
        bgeu t0, t1, test2_bgeu
        j Fail_bgeu_1

    test2_bgeu:
        li   t0, 0x00000001
        li   t1, 0x00000002
        bgeu t0, t1, Fail_bgeu_2
        j test3_bgeu

    test3_bgeu:
        li   t0, 0xffffffff
        li   t1, 0x00000001
        bgeu t0, t1, test4_bgeu
        j Fail_bgeu_3

    test4_bgeu:
        li   t0, 0x00000001
        li   t1, 0xffffffff
        bgeu t0, t1, Fail_bgeu_4
        j test5_bgeu

    test5_bgeu:
        li   t0, 0x00000001
        li   t1, 0x00000001
        bgeu t0, t1, test6_bgeu
        j Fail_bgeu_5

    test6_bgeu:
        li   t0, 0x7fffffff
        li   t1, 0x80000000
        bgeu t0, t1, Fail_bgeu_6
        j test7_bgeu

    test7_bgeu:
        li   t0, 0x80000000
        li   t1, 0x7fffffff
        bgeu t0, t1, test8_bgeu
        j Fail_bgeu_7

    test8_bgeu:
        li   t0, 0xffffffff
        li   t1, 0xfffffffe
        bgeu t0, t1, test9_bgeu
        j Fail_bgeu_8

    test9_bgeu:
        li   t0, 0x12345679
        li   t1, 0x12345678
        bgeu t0, t1, test10_bgeu
        j Fail_bgeu_9

    test10_bgeu:
        li   t0, 0xabcdef00
        li   t1, 0x00000001
        bgeu t0, t1, pass
        j Fail_bgeu_10

    pass:
        j return_bge_test

Fail_bge_1:
    li   gp, 1101
    j    fail

Fail_bge_2:
    li   gp, 1102
    j    fail

Fail_bge_3:
    li   gp, 1103
    j    fail

Fail_bge_4:
    li   gp, 1104
    j    fail

Fail_bge_5:
    li   gp, 1105
    j    fail

Fail_bge_6:
    li   gp, 1106
    j    fail

Fail_bge_7:
    li   gp, 1107
    j    fail

Fail_bge_8:
    li   gp, 1108
    j    fail

Fail_bge_9:
    li   gp, 1109
    j    fail

Fail_bge_10:
    li   gp, 1110
    j    fail

Fail_bgeu_1:
    li   gp, 1111
    j    fail

Fail_bgeu_2:
    li   gp, 1112
    j    fail

Fail_bgeu_3:
    li   gp, 1113
    j    fail

Fail_bgeu_4:
    li   gp, 1114
    j    fail

Fail_bgeu_5:
    li   gp, 1115
    j    fail

Fail_bgeu_6:
    li   gp, 1116
    j    fail

Fail_bgeu_7:
    li   gp, 1117
    j    fail

Fail_bgeu_8:
    li   gp, 1118
    j    fail

Fail_bgeu_9:
    li   gp, 1119
    j    fail

Fail_bgeu_10:
    li   gp, 1120
    j    fail
