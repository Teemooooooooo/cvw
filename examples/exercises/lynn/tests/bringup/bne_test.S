.extern return_bne_test
.extern fail

    .section .text.init
    .globl bne_test
    .type  bne_test, @function

bne_test:
    test1_bne:
        li   t0, 0x00000001
        li   t1, 0x00000002
        bne  t0, t1, test2_bne
        j Fail_bne_1

    test2_bne:
        li   t0, 0x00000001
        li   t1, 0x00000001
        bne  t0, t1, Fail_bne_2
        j test3_bne

    test3_bne:
        li   t0, 0xffffffff
        li   t1, 0x00000000
        bne  t0, t1, test4_bne
        j Fail_bne_3

    test4_bne:
        li   t0, 0x12345678
        li   t1, 0x12345678
        bne  t0, t1, Fail_bne_4
        j test5_bne

    test5_bne:
        li   t0, 0xaaaaaaaa
        li   t1, 0x55555555
        bne  t0, t1, test6_bne
        j Fail_bne_5

    test6_bne:
        li   t0, 0x00000000
        li   t1, 0x00000000
        bne  t0, t1, Fail_bne_6
        j test7_bne

    test7_bne:
        li   t0, 0x80000000
        li   t1, 0x7fffffff
        bne  t0, t1, test8_bne
        j Fail_bne_7

    test8_bne:
        li   t0, 0xfffffffe
        li   t1, 0xffffffff
        bne  t0, t1, test9_bne
        j Fail_bne_8

test9_bne:
        li   t0, 0x12340000
        li   t1, 0x12340000
        bne  t0, t1, Fail_bne_9
        j pass


    pass:
        j return_bne_test

Fail_bne_1:
    li   gp, 901
    j    fail

Fail_bne_2:
    li   gp, 902
    j    fail

Fail_bne_3:
    li   gp, 903
    j    fail

Fail_bne_4:
    li   gp, 904
    j    fail

Fail_bne_5:
    li   gp, 905
    j    fail

Fail_bne_6:
    li   gp, 906
    j    fail

Fail_bne_7:
    li   gp, 907
    j    fail

Fail_bne_8:
    li   gp, 908
    j    fail

Fail_bne_9:
    li   gp, 909
    j    fail
