.extern return_sh_test
.extern fail

    .section .text.init
    .globl sh_test
    .type  sh_test, @function

sh_test:
    test1_sh:
        la   t0, test_data
        li   t1, 0x1234
        sh   t1, 0(t0)
        lh   t2, 0(t0)
        li   t3, 0x1234
        beq  t2, t3, test2_sh
        j Fail_sh_1

    test2_sh:
        la   t0, test_data
        li   t1, 0xaaaa
        sh   t1, 2(t0)
        lhu  t2, 2(t0)
        li   t3, 0xaaaa
        beq  t2, t3, test3_sh
        j Fail_sh_2

    test3_sh:
        la   t0, test_data
        li   t1, 0xffff
        sh   t1, 4(t0)
        lh   t2, 4(t0)
        li   t3, 0xffffffff
        beq  t2, t3, test4_sh
        j Fail_sh_3

    test4_sh:
        la   t0, test_data
        li   t1, 0x0000
        sh   t1, 6(t0)
        lh   t2, 6(t0)
        li   t3, 0x0000
        beq  t2, t3, test5_sh
        j Fail_sh_4

    test5_sh:
        la   t0, test_data
        li   t1, 0x12345678
        sh   t1, 8(t0)
        lhu  t2, 8(t0)
        li   t3, 0x5678
        beq  t2, t3, test6_sh
        j Fail_sh_5

    test6_sh:
        la   t0, test_data
        li   t1, 0x8000
        sh   t1, 10(t0)
        lh   t2, 10(t0)
        li   t3, 0xffff8000
        beq  t2, t3, test7_sh
        j Fail_sh_6

    test7_sh:
        la   t0, test_data
        li   t1, 0x7fff
        sh   t1, 12(t0)
        lh   t2, 12(t0)
        li   t3, 0x00007fff
        beq  t2, t3, test8_sh
        j Fail_sh_7

    test8_sh:
        la   t0, test_data
        li   t1, 0x5555
        sh   t1, 14(t0)
        lhu  t2, 14(t0)
        li   t3, 0x5555
        beq  t2, t3, test9_sh
        j Fail_sh_8

    test9_sh:
        la   t0, test_data
        li   t1, 0xffff9000
        sh   t1, 16(t0)
        lhu  t2, 16(t0)
        li   t3, 0x9000
        beq  t2, t3, test10_sh
        j Fail_sh_9

    test10_sh:
        la   t0, test_data
        li   t1, 0x0001
        sh   t1, 18(t0)
        lh   t2, 18(t0)
        li   t3, 0x0001
        beq  t2, t3, pass
        j Fail_sh_10

    pass:
        j return_sh_test

    .section .data
    .align 2
test_data:
    .half 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000

    .section .text.init

Fail_sh_1:
    li   gp, 801
    j    fail

Fail_sh_2:
    li   gp, 802
    j    fail

Fail_sh_3:
    li   gp, 803
    j    fail

Fail_sh_4:
    li   gp, 804
    j    fail

Fail_sh_5:
    li   gp, 805
    j    fail

Fail_sh_6:
    li   gp, 806
    j    fail

Fail_sh_7:
    li   gp, 807
    j    fail

Fail_sh_8:
    li   gp, 808
    j    fail

Fail_sh_9:
    li   gp, 809
    j    fail

Fail_sh_10:
    li   gp, 810
    j    fail
