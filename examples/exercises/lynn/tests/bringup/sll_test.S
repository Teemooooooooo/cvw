// sll/slli_test
// Ellen Yu
// ellyu@hmc.edu
// 2/8/2026
.extern return_sll_test
.extern fail

    .section .text.init
    .globl sll_test
    .type  sll_test, @function

sll_test:
    test1_sll:
        li   t0, 0xffffffff
        li   t1, 0b10
        sll  t2, t0, t1
        li   t3, 0xfffffffc
        beq  t2, t3, test2_sll
        j Fail_sll_1

    test2_sll:
        li   t0, 0x00000001
        li   t1, 4
        sll  t2, t0, t1
        li   t3, 0x00000010
        beq  t2, t3, test3_sll
        j Fail_sll_2

    test3_sll:
        li   t0, 0x12345678
        li   t1, 8
        sll  t2, t0, t1
        li   t3, 0x34567800
        beq  t2, t3, test4_sll
        j Fail_sll_3

    test4_sll:
        li   t0, 0xabcdef00
        li   t1, 12
        sll  t2, t0, t1
        li   t3, 0xdef00000
        beq  t2, t3, test5_sll
        j Fail_sll_4

    test5_sll:
        li   t0, 0x0000ffff
        li   t1, 16
        sll  t2, t0, t1
        li   t3, 0xffff0000
        beq  t2, t3, test6_sll
        j Fail_sll_5

    test6_sll:
        li   t0, 0x12345678
        li   t1, 0
        sll  t2, t0, t1
        li   t3, 0x12345678
        beq  t2, t3, test7_sll
        j Fail_sll_6

    test7_sll:
        li   t0, 0xaaaaaaaa
        li   t1, 1
        sll  t2, t0, t1
        li   t3, 0x55555554
        beq  t2, t3, test8_sll
        j Fail_sll_7

    test8_sll:
        li   t0, 0x00000001
        li   t1, 31
        sll  t2, t0, t1
        li   t3, 0x80000000
        beq  t2, t3, test9_sll
        j Fail_sll_8

    test9_sll:
        li   t0, 0x00000123
        li   t1, 20
        sll  t2, t0, t1
        li   t3, 0x12300000
        beq  t2, t3, test10_sll
        j Fail_sll_9

    test10_sll:
        li   t0, 0x80000000
        li   t1, 1
        sll  t2, t0, t1
        li   t3, 0x00000000
        beq  t2, t3, test1_slli
        j Fail_sll_10

    test1_slli:
        li   t0, 0xffffffff
        slli t2, t0, 0b10
        li   t3, 0xfffffffc
        beq  t2, t3, test2_slli
        j Fail_slli_1

    test2_slli:
        li   t0, 0x00000001
        slli t2, t0, 4
        li   t3, 0x00000010
        beq  t2, t3, test3_slli
        j Fail_slli_2

    test3_slli:
        li   t0, 0x12345678
        slli t2, t0, 8
        li   t3, 0x34567800
        beq  t2, t3, test4_slli
        j Fail_slli_3

    test4_slli:
        li   t0, 0xabcdef00
        slli t2, t0, 12
        li   t3, 0xdef00000
        beq  t2, t3, test5_slli
        j Fail_slli_4

    test5_slli:
        li   t0, 0x0000ffff
        slli t2, t0, 16
        li   t3, 0xffff0000
        beq  t2, t3, test6_slli
        j Fail_slli_5

    test6_slli:
        li   t0, 0x12345678
        slli t2, t0, 0
        li   t3, 0x12345678
        beq  t2, t3, test7_slli
        j Fail_slli_6

    test7_slli:
        li   t0, 0xaaaaaaaa
        slli t2, t0, 1
        li   t3, 0x55555554
        beq  t2, t3, test8_slli
        j Fail_slli_7

    test8_slli:
        li   t0, 0x00000001
        slli t2, t0, 31
        li   t3, 0x80000000
        beq  t2, t3, test9_slli
        j Fail_slli_8

    test9_slli:
        li   t0, 0x00000123
        slli t2, t0, 20
        li   t3, 0x12300000
        beq  t2, t3, test10_slli
        j Fail_slli_9

    test10_slli:
        li   t0, 0x80000000
        slli t2, t0, 1
        li   t3, 0x00000000
        beq  t2, t3, pass
        j Fail_slli_10

    pass:
        j return_sll_test

Fail_sll_1:
    li   gp, 101
    j    fail

Fail_sll_2:
    li   gp, 102
    j    fail

Fail_sll_3:
    li   gp, 103
    j    fail

Fail_sll_4:
    li   gp, 104
    j    fail

Fail_sll_5:
    li   gp, 105
    j    fail

Fail_sll_6:
    li   gp, 106
    j    fail

Fail_sll_7:
    li   gp, 107
    j    fail

Fail_sll_8:
    li   gp, 108
    j    fail

Fail_sll_9:
    li   gp, 109
    j    fail

Fail_sll_10:
    li   gp, 110
    j    fail

Fail_slli_1:
    li   gp, 111
    j    fail

Fail_slli_2:
    li   gp, 112
    j    fail

Fail_slli_3:
    li   gp, 113
    j    fail

Fail_slli_4:
    li   gp, 114
    j    fail

Fail_slli_5:
    li   gp, 115
    j    fail

Fail_slli_6:
    li   gp, 116
    j    fail

Fail_slli_7:
    li   gp, 117
    j    fail

Fail_slli_8:
    li   gp, 118
    j    fail

Fail_slli_9:
    li   gp, 119
    j    fail

Fail_slli_10:
    li   gp, 120
    j    fail
