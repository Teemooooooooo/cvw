.extern return_lh_test
.extern fail

    .section .text.init
    .globl lh_test
    .type  lh_test, @function

lh_test:
    test1_lh:
        la   t0, test_data
        lh   t1, 0(t0)
        li   t2, 0xffff8000
        beq  t1, t2, test2_lh
        j Fail_lh_1

    test2_lh:
        la   t0, test_data
        lh   t1, 2(t0)
        li   t2, 0x00007fff
        beq  t1, t2, test3_lh
        j Fail_lh_2

    test3_lh:
        la   t0, test_data
        lh   t1, 4(t0)
        li   t2, 0xffffaaaa
        beq  t1, t2, test4_lh
        j Fail_lh_3

    test4_lh:
        la   t0, test_data
        lh   t1, 6(t0)
        li   t2, 0x00005555
        beq  t1, t2, test5_lh
        j Fail_lh_4

    test5_lh:
        la   t0, test_data
        lh   t1, 8(t0)
        li   t2, 0xffffffff
        beq  t1, t2, test6_lh
        j Fail_lh_5

    test6_lh:
        la   t0, test_data
        lh   t1, 10(t0)
        li   t2, 0x00000000
        beq  t1, t2, test7_lh
        j Fail_lh_6

    test7_lh:
        la   t0, test_data
        lh   t1, 12(t0)
        li   t2, 0x00001234
        beq  t1, t2, test8_lh
        j Fail_lh_7

    test8_lh:
        la   t0, test_data
        lh   t1, 14(t0)
        li   t2, 0xffff9000
        beq  t1, t2, test9_lh
        j Fail_lh_8

    test9_lh:
        la   t0, test_data
        lh   t1, 16(t0)
        li   t2, 0x00000001
        beq  t1, t2, test10_lh
        j Fail_lh_9

    test10_lh:
        la   t0, test_data
        lh   t1, 18(t0)
        li   t2, 0xfffffffe
        beq  t1, t2, test1_lhu
        j Fail_lh_10

    test1_lhu:
        la   t0, test_data
        lhu  t1, 0(t0)
        li   t2, 0x00008000
        beq  t1, t2, test2_lhu
        j Fail_lhu_1

    test2_lhu:
        la   t0, test_data
        lhu  t1, 2(t0)
        li   t2, 0x00007fff
        beq  t1, t2, test3_lhu
        j Fail_lhu_2

    test3_lhu:
        la   t0, test_data
        lhu  t1, 4(t0)
        li   t2, 0x0000aaaa
        beq  t1, t2, test4_lhu
        j Fail_lhu_3

    test4_lhu:
        la   t0, test_data
        lhu  t1, 6(t0)
        li   t2, 0x00005555
        beq  t1, t2, test5_lhu
        j Fail_lhu_4

    test5_lhu:
        la   t0, test_data
        lhu  t1, 8(t0)
        li   t2, 0x0000ffff
        beq  t1, t2, test6_lhu
        j Fail_lhu_5

    test6_lhu:
        la   t0, test_data
        lhu  t1, 10(t0)
        li   t2, 0x00000000
        beq  t1, t2, test7_lhu
        j Fail_lhu_6

    test7_lhu:
        la   t0, test_data
        lhu  t1, 12(t0)
        li   t2, 0x00001234
        beq  t1, t2, test8_lhu
        j Fail_lhu_7

    test8_lhu:
        la   t0, test_data
        lhu  t1, 14(t0)
        li   t2, 0x00009000
        beq  t1, t2, test9_lhu
        j Fail_lhu_8

    test9_lhu:
        la   t0, test_data
        lhu  t1, 16(t0)
        li   t2, 0x00000001
        beq  t1, t2, test10_lhu
        j Fail_lhu_9

    test10_lhu:
        la   t0, test_data
        lhu  t1, 18(t0)
        li   t2, 0x0000fffe
        beq  t1, t2, pass
        j Fail_lhu_10

    pass:
        j return_lh_test

    .section .data
    .align 2
test_data:
    .half 0x8000, 0x7fff, 0xaaaa, 0x5555, 0xffff, 0x0000, 0x1234, 0x9000, 0x0001, 0xfffe
.section .text.init

Fail_lh_1:
    li   gp, 601
    j    fail

Fail_lh_2:
    li   gp, 602
    j    fail

Fail_lh_3:
    li   gp, 603
    j    fail

Fail_lh_4:
    li   gp, 604
    j    fail

Fail_lh_5:
    li   gp, 605
    j    fail

Fail_lh_6:
    li   gp, 606
    j    fail

Fail_lh_7:
    li   gp, 607
    j    fail

Fail_lh_8:
    li   gp, 608
    j    fail

Fail_lh_9:
    li   gp, 609
    j    fail

Fail_lh_10:
    li   gp, 610
    j    fail

Fail_lhu_1:
    li   gp, 611
    j    fail

Fail_lhu_2:
    li   gp, 612
    j    fail

Fail_lhu_3:
    li   gp, 613
    j    fail

Fail_lhu_4:
    li   gp, 614
    j    fail

Fail_lhu_5:
    li   gp, 615
    j    fail

Fail_lhu_6:
    li   gp, 616
    j    fail

Fail_lhu_7:
    li   gp, 617
    j    fail

Fail_lhu_8:
    li   gp, 618
    j    fail

Fail_lhu_9:
    li   gp, 619
    j    fail

Fail_lhu_10:
    li   gp, 620
    j    fail
