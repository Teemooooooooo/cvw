// srl/srli_test
// Ellen Yu
// ellyu@hmc.edu
// 2/8/2026

.extern return_srl_test
.extern fail

    .section .text.init
    .globl srl_test
    .type  srl_test, @function

srl_test:
    test1_srl:
        li   t0, 0xffffffff
        li   t1, 0b10
        srl  t2, t0, t1
        li   t3, 0x3fffffff
        beq  t2, t3, test2_srl
        j Fail_srl_1

    test2_srl:
        li   t0, 0x80000000
        li   t1, 4
        srl  t2, t0, t1
        li   t3, 0x08000000
        beq  t2, t3, test3_srl
        j Fail_srl_2

    test3_srl:
        li   t0, 0x12345678
        li   t1, 8
        srl  t2, t0, t1
        li   t3, 0x00123456
        beq  t2, t3, test4_srl
        j Fail_srl_3

    test4_srl:
        li   t0, 0xabcdef00
        li   t1, 12
        srl  t2, t0, t1
        li   t3, 0x000abcde
        beq  t2, t3, test5_srl
        j Fail_srl_4

    test5_srl:
        li   t0, 0xffff0000
        li   t1, 16
        srl  t2, t0, t1
        li   t3, 0x0000ffff
        beq  t2, t3, test6_srl
        j Fail_srl_5

    test6_srl:
        li   t0, 0x12345678
        li   t1, 0
        srl  t2, t0, t1
        li   t3, 0x12345678
        beq  t2, t3, test7_srl
        j Fail_srl_6

    test7_srl:
        li   t0, 0xaaaaaaaa
        li   t1, 1
        srl  t2, t0, t1
        li   t3, 0x55555555
        beq  t2, t3, test8_srl
        j Fail_srl_7

    test8_srl:
        li   t0, 0x80000001
        li   t1, 31
        srl  t2, t0, t1
        li   t3, 0x00000001
        beq  t2, t3, test9_srl
        j Fail_srl_8

    test9_srl:
        li   t0, 0xfedcba98
        li   t1, 20
        srl  t2, t0, t1
        li   t3, 0x00000fed
        beq  t2, t3, test10_srl
        j Fail_srl_9

    test10_srl:
        li   t0, 0x00000001
        li   t1, 1
        srl  t2, t0, t1
        li   t3, 0x00000000
        beq  t2, t3, test1_srli
        j Fail_srl_10

    test1_srli:
        li   t0, 0xffffffff
        srli t2, t0, 0b10
        li   t3, 0x3fffffff
        beq  t2, t3, test2_srli
        j Fail_srli_1

    test2_srli:
        li   t0, 0x80000000
        srli t2, t0, 4
        li   t3, 0x08000000
        beq  t2, t3, test3_srli
        j Fail_srli_2

    test3_srli:
        li   t0, 0x12345678
        srli t2, t0, 8
        li   t3, 0x00123456
        beq  t2, t3, test4_srli
        j Fail_srli_3

    test4_srli:
        li   t0, 0xabcdef00
        srli t2, t0, 12
        li   t3, 0x000abcde
        beq  t2, t3, test5_srli
        j Fail_srli_4

    test5_srli:
        li   t0, 0xffff0000
        srli t2, t0, 16
        li   t3, 0x0000ffff
        beq  t2, t3, test6_srli
        j Fail_srli_5

    test6_srli:
        li   t0, 0x12345678
        srli t2, t0, 0
        li   t3, 0x12345678
        beq  t2, t3, test7_srli
        j Fail_srli_6

    test7_srli:
        li   t0, 0xaaaaaaaa
        srli t2, t0, 1
        li   t3, 0x55555555
        beq  t2, t3, test8_srli
        j Fail_srli_7

    test8_srli:
        li   t0, 0x80000001
        srli t2, t0, 31
        li   t3, 0x00000001
        beq  t2, t3, test9_srli
        j Fail_srli_8

    test9_srli:
        li   t0, 0xfedcba98
        srli t2, t0, 20
        li   t3, 0x00000fed
        beq  t2, t3, test10_srli
        j Fail_srli_9

    test10_srli:
        li   t0, 0x00000001
        srli t2, t0, 1
        li   t3, 0x00000000
        beq  t2, t3, pass
        j Fail_srli_10

    pass:
        j return_srl_test

Fail_srl_1:
    li   gp, 201
    j    fail

Fail_srl_2:
    li   gp, 202
    j    fail

Fail_srl_3:
    li   gp, 203
    j    fail

Fail_srl_4:
    li   gp, 204
    j    fail

Fail_srl_5:
    li   gp, 205
    j    fail

Fail_srl_6:
    li   gp, 206
    j    fail

Fail_srl_7:
    li   gp, 207
    j    fail

Fail_srl_8:
    li   gp, 208
    j    fail

Fail_srl_9:
    li   gp, 209
    j    fail

Fail_srl_10:
    li   gp, 210
    j    fail

Fail_srli_1:
    li   gp, 211
    j    fail

Fail_srli_2:
    li   gp, 212
    j    fail

Fail_srli_3:
    li   gp, 213
    j    fail

Fail_srli_4:
    li   gp, 214
    j    fail

Fail_srli_5:
    li   gp, 215
    j    fail

Fail_srli_6:
    li   gp, 216
    j    fail

Fail_srli_7:
    li   gp, 217
    j    fail

Fail_srli_8:
    li   gp, 218
    j    fail

Fail_srli_9:
    li   gp, 219
    j    fail

Fail_srli_10:
    li   gp, 220
    j    fail
