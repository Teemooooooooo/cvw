.extern return_lb_test
.extern fail

    .section .text.init
    .globl lb_test
    .type  lb_test, @function

lb_test:
    test1_lb:
        la   t0, test_data
        lb   t1, 0(t0)
        li   t2, 0xffffff80
        beq  t1, t2, test2_lb
        j Fail_lb_1

    test2_lb:
        la   t0, test_data
        lb   t1, 1(t0)
        li   t2, 0x0000007f
        beq  t1, t2, test3_lb
        j Fail_lb_2

    test3_lb:
        la   t0, test_data
        lb   t1, 2(t0)
        li   t2, 0xffffffaa
        beq  t1, t2, test4_lb
        j Fail_lb_3

    test4_lb:
        la   t0, test_data
        lb   t1, 3(t0)
        li   t2, 0x00000055
        beq  t1, t2, test5_lb
        j Fail_lb_4

    test5_lb:
        lui   t0, %hi(test_data)
        addi  t0, t0, %lo(test_data)
        lb   t1, 4(t0)
        li   t2, 0xffffffff
        beq  t1, t2, test6_lb
        j Fail_lb_5

    test6_lb:
        la   t0, test_data
        lb   t1, 5(t0)
        li   t2, 0x00000000
        beq  t1, t2, test7_lb
        j Fail_lb_6

    test7_lb:
        la   t0, test_data
        lb   t1, 6(t0)
        li   t2, 0x00000012
        beq  t1, t2, test8_lb
        j Fail_lb_7

    test8_lb:
        la   t0, test_data
        lb   t1, 7(t0)
        li   t2, 0xffffff90
        beq  t1, t2, test9_lb
        j Fail_lb_8

    test9_lb:
        la   t0, test_data
        lb   t1, 8(t0)
        li   t2, 0x00000001
        beq  t1, t2, test10_lb
        j Fail_lb_9

    test10_lb:
        la   t0, test_data
        lb   t1, 9(t0)
        li   t2, 0xfffffffe
        beq  t1, t2, test1_lbu
        j Fail_lb_10

    test1_lbu:
        la   t0, test_data
        lbu  t1, 0(t0)
        li   t2, 0x00000080
        beq  t1, t2, test2_lbu
        j Fail_lbu_1

    test2_lbu:
        la   t0, test_data
        lbu  t1, 1(t0)
        li   t2, 0x0000007f
        beq  t1, t2, test3_lbu
        j Fail_lbu_2

    test3_lbu:
        la   t0, test_data
        lbu  t1, 2(t0)
        li   t2, 0x000000aa
        beq  t1, t2, test4_lbu
        j Fail_lbu_3

    test4_lbu:
        la   t0, test_data
        lbu  t1, 3(t0)
        li   t2, 0x00000055
        beq  t1, t2, test5_lbu
        j Fail_lbu_4

    test5_lbu:
        la   t0, test_data
        lbu  t1, 4(t0)
        li   t2, 0x000000ff
        beq  t1, t2, test6_lbu
        j Fail_lbu_5

    test6_lbu:
        la   t0, test_data
        lbu  t1, 5(t0)
        li   t2, 0x00000000
        beq  t1, t2, test7_lbu
        j Fail_lbu_6

    test7_lbu:
        la   t0, test_data
        lbu  t1, 6(t0)
        li   t2, 0x00000012
        beq  t1, t2, test8_lbu
        j Fail_lbu_7

    test8_lbu:
        la   t0, test_data
        lbu  t1, 7(t0)
        li   t2, 0x00000090
        beq  t1, t2, test9_lbu
        j Fail_lbu_8

    test9_lbu:
        la   t0, test_data
        lbu  t1, 8(t0)
        li   t2, 0x00000001
        beq  t1, t2, test10_lbu
        j Fail_lbu_9

    test10_lbu:
        la   t0, test_data
        lbu  t1, 9(t0)
        li   t2, 0x000000fe
        beq  t1, t2, pass
        j Fail_lbu_10

    pass:
        j return_lb_test

    .section .data
test_data:
    .byte 0x80, 0x7f, 0xaa, 0x55, 0xff, 0x00, 0x12, 0x90, 0x01, 0xfe

.section .text.init

Fail_lb_1:
    li   gp, 501
    j    fail

Fail_lb_2:
    li   gp, 502
    j    fail

Fail_lb_3:
    li   gp, 503
    j    fail

Fail_lb_4:
    li   gp, 504
    j    fail

Fail_lb_5:
    li   gp, 505
    j    fail

Fail_lb_6:
    li   gp, 506
    j    fail

Fail_lb_7:
    li   gp, 507
    j    fail

Fail_lb_8:
    li   gp, 508
    j    fail

Fail_lb_9:
    li   gp, 509
    j    fail

Fail_lb_10:
    li   gp, 510
    j    fail

Fail_lbu_1:
    li   gp, 511
    j    fail

Fail_lbu_2:
    li   gp, 512
    j    fail

Fail_lbu_3:
    li   gp, 513
    j    fail

Fail_lbu_4:
    li   gp, 514
    j    fail

Fail_lbu_5:
    li   gp, 515
    j    fail

Fail_lbu_6:
    li   gp, 516
    j    fail

Fail_lbu_7:
    li   gp, 517
    j    fail

Fail_lbu_8:
    li   gp, 518
    j    fail

Fail_lbu_9:
    li   gp, 519
    j    fail

Fail_lbu_10:
    li   gp, 520
    j    fail
