.extern return_auipc_test
.extern fail

    .section .text.init
    .globl auipc_test
    .type  auipc_test, @function

auipc_test:
    test1_auipc:
        auipc t0, 0
        la    t1, test1_auipc
        beq   t0, t1, test2_auipc
        j Fail_auipc_1

    test2_auipc:
        auipc t0, 0x12345
        la    t1, test2_auipc
        lui   t2, 0x12345
        add   t1, t1, t2
        beq   t0, t1, test3_auipc
        j Fail_auipc_2

    test3_auipc:
        auipc t0, 0xfffff
        la    t1, test3_auipc
        lui   t2, 0xfffff
        add   t1, t1, t2
        beq   t0, t1, test4_auipc
        j Fail_auipc_3

    test4_auipc:
        auipc t0, 0x00001
        la    t1, test4_auipc
        lui   t2, 0x00001
        add   t1, t1, t2
        beq   t0, t1, test5_auipc
        j Fail_auipc_4

    test5_auipc:
        auipc t0, 0x80000
        la    t1, test5_auipc
        lui   t2, 0x80000
        add   t1, t1, t2
        beq   t0, t1, test6_auipc
        j Fail_auipc_5

    test6_auipc:
        auipc t0, 0x7ffff
        la    t1, test6_auipc
        lui   t2, 0x7ffff
        add   t1, t1, t2
        beq   t0, t1, test7_auipc
        j Fail_auipc_6

    test7_auipc:
        auipc t0, 0xabcde
        la    t1, test7_auipc
        lui   t2, 0xabcde
        add   t1, t1, t2
        beq   t0, t1, test8_auipc
        j Fail_auipc_7

    test8_auipc:
        auipc t0, 0x55555
        la    t1, test8_auipc
        lui   t2, 0x55555
        add   t1, t1, t2
        beq   t0, t1, test9_auipc
        j Fail_auipc_8

    test9_auipc:
        auipc t0, 0xaaaaa
        la    t1, test9_auipc
        lui   t2, 0xaaaaa
        add   t1, t1, t2
        beq   t0, t1, test10_auipc
        j Fail_auipc_9

    test10_auipc:
        auipc t0, 0xcafeb
        la    t1, test10_auipc
        lui   t2, 0xcafeb
        add   t1, t1, t2
        beq   t0, t1, pass
        j Fail_auipc_10

    pass:
        j return_auipc_test

Fail_auipc_1:
    li   gp, 1401
    j    fail

Fail_auipc_2:
    li   gp, 1402
    j    fail

Fail_auipc_3:
    li   gp, 1403
    j    fail

Fail_auipc_4:
    li   gp, 1404
    j    fail

Fail_auipc_5:
    li   gp, 1405
    j    fail

Fail_auipc_6:
    li   gp, 1406
    j    fail

Fail_auipc_7:
    li   gp, 1407
    j    fail

Fail_auipc_8:
    li   gp, 1408
    j    fail

Fail_auipc_9:
    li   gp, 1409
    j    fail

Fail_auipc_10:
    li   gp, 1410
    j    fail
