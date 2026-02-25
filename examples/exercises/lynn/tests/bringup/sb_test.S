.extern return_sb_test
.extern fail

    .section .text.init
    .globl sb_test
    .type  sb_test, @function

sb_test:
    test1_sb:
        la   t0, test_data
        li   t1, 0x12
        sb   t1, 0(t0)
        lb   t2, 0(t0)
        li   t3, 0x12
        beq  t2, t3, test2_sb
        j Fail_sb_1

    test2_sb:
        la   t0, test_data
        li   t1, 0xaa
        sb   t1, 1(t0)
        lbu  t2, 1(t0)
        li   t3, 0xaa
        beq  t2, t3, test3_sb
        j Fail_sb_2

    test3_sb:
        la   t0, test_data
        li   t1, 0xff
        sb   t1, 2(t0)
        lb   t2, 2(t0)
        li   t3, 0xffffffff
        beq  t2, t3, test4_sb
        j Fail_sb_3

    test4_sb:
        la   t0, test_data
        li   t1, 0x00
        sb   t1, 3(t0)
        lb   t2, 3(t0)
        li   t3, 0x00
        beq  t2, t3, test5_sb
        j Fail_sb_4

    test5_sb:
        la   t0, test_data
        li   t1, 0x12345678
        sb   t1, 4(t0)
        lbu  t2, 4(t0)
        li   t3, 0x78
        beq  t2, t3, test6_sb
        j Fail_sb_5

    test6_sb:
        la   t0, test_data
        li   t1, 0x80
        sb   t1, 5(t0)
        lb   t2, 5(t0)
        li   t3, 0xffffff80
        beq  t2, t3, test7_sb
        j Fail_sb_6

    test7_sb:
        la   t0, test_data
        li   t1, 0x7f
        sb   t1, 6(t0)
        lb   t2, 6(t0)
        li   t3, 0x0000007f
        beq  t2, t3, test8_sb
        j Fail_sb_7

    test8_sb:
        la   t0, test_data
        li   t1, 0x55
        sb   t1, 7(t0)
        lbu  t2, 7(t0)
        li   t3, 0x55
        beq  t2, t3, test9_sb
        j Fail_sb_8

    test9_sb:
        la   t0, test_data
        li   t1, 0xffffff90
        sb   t1, 8(t0)
        lbu  t2, 8(t0)
        li   t3, 0x90
        beq  t2, t3, test10_sb
        j Fail_sb_9

    test10_sb:
        la   t0, test_data
        li   t1, 0x01
        sb   t1, 9(t0)
        lb   t2, 9(t0)
        li   t3, 0x01
        beq  t2, t3, pass
        j Fail_sb_10

    pass:
        j return_sb_test

    .section .data
test_data:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

    .section .text.init

Fail_sb_1:
    li   gp, 701
    j    fail

Fail_sb_2:
    li   gp, 702
    j    fail

Fail_sb_3:
    li   gp, 703
    j    fail

Fail_sb_4:
    li   gp, 704
    j    fail

Fail_sb_5:
    li   gp, 705
    j    fail

Fail_sb_6:
    li   gp, 706
    j    fail

Fail_sb_7:
    li   gp, 707
    j    fail

Fail_sb_8:
    li   gp, 708
    j    fail

Fail_sb_9:
    li   gp, 709
    j    fail

Fail_sb_10:
    li   gp, 710
    j    fail
