// sltu/sltiu_test
// Ellen Yu
// ellyu@hmc.edu
// 2/8/2026

.extern return_sltu_test
.extern fail

    .section .text.init
    .globl sltu_test
    .type  sltu_test, @function

sltu_test:
    test1_sltu:
        li   t0, 0x00000001
        li   t1, 0x00000002
        sltu t2, t0, t1
        li   t3, 1
        beq  t2, t3, test2_sltu
        j Fail_sltu_1

    test2_sltu:
        li   t0, 0x00000002
        li   t1, 0x00000001
        sltu t2, t0, t1
        li   t3, 0
        beq  t2, t3, test3_sltu
        j Fail_sltu_2

    test3_sltu:
        li   t0, 0xffffffff
        li   t1, 0x00000001
        sltu t2, t0, t1
        li   t3, 0
        beq  t2, t3, test4_sltu
        j Fail_sltu_3

    test4_sltu:
        li   t0, 0x00000001
        li   t1, 0xffffffff
        sltu t2, t0, t1
        li   t3, 1
        beq  t2, t3, test5_sltu
        j Fail_sltu_4

    test5_sltu:
        li   t0, 0x12345678
        li   t1, 0x12345678
        sltu t2, t0, t1
        li   t3, 0
        beq  t2, t3, test6_sltu
        j Fail_sltu_5

    test6_sltu:
        li   t0, 0x80000000
        li   t1, 0x7fffffff
        sltu t2, t0, t1
        li   t3, 0
        beq  t2, t3, test7_sltu
        j Fail_sltu_6

    test7_sltu:
        li   t0, 0x7fffffff
        li   t1, 0x80000000
        sltu t2, t0, t1
        li   t3, 1
        beq  t2, t3, test8_sltu
        j Fail_sltu_7

    test8_sltu:
        li   t0, 0x00000000
        li   t1, 0x00000001
        sltu t2, t0, t1
        li   t3, 1
        beq  t2, t3, test9_sltu
        j Fail_sltu_8

    test9_sltu:
        li   t0, 0xaaaaaaaa
        li   t1, 0x55555555
        sltu t2, t0, t1
        li   t3, 0
        beq  t2, t3, test10_sltu
        j Fail_sltu_9

    test10_sltu:
        li   t0, 0x55555555
        li   t1, 0xaaaaaaaa
        sltu t2, t0, t1
        li   t3, 1
        beq  t2, t3, test1_sltiu
        j Fail_sltu_10

    test1_sltiu:
        li   t0, 0x00000001
        sltiu t2, t0, 2
        li   t3, 1
        beq  t2, t3, test2_sltiu
        j Fail_sltiu_1

    test2_sltiu:
        li   t0, 0x00000002
        sltiu t2, t0, 1
        li   t3, 0
        beq  t2, t3, test3_sltiu
        j Fail_sltiu_2

    test3_sltiu:
        li   t0, 0xffffffff
        sltiu t2, t0, 1
        li   t3, 0
        beq  t2, t3, test4_sltiu
        j Fail_sltiu_3

    test4_sltiu:
        li   t0, 0x00000001
        sltiu t2, t0, 0xab
        li   t3, 1
        beq  t2, t3, test5_sltiu
        j Fail_sltiu_4

    test5_sltiu:
        li   t0, 0x12345678
        sltiu t2, t0, 0x678
        li   t3, 0
        beq  t2, t3, test6_sltiu
        j Fail_sltiu_5

    test6_sltiu:
        li   t0, 0x80000000
        sltiu t2, t0, 0x7ff
        li   t3, 0
        beq  t2, t3, test7_sltiu
        j Fail_sltiu_6

    test7_sltiu:
        li   t0, 0x00000000
        sltiu t2, t0, 1
        li   t3, 1
        beq  t2, t3, test8_sltiu
        j Fail_sltiu_7

    test8_sltiu:
        li   t0, 0xaaaaaaaa
        sltiu t2, t0, 0x555
        li   t3, 0
        beq  t2, t3, test9_sltiu
        j Fail_sltiu_8

    test9_sltiu:
        li   t0, 0x00000100
        sltiu t2, t0, 0x100
        li   t3, 0
        beq  t2, t3, test10_sltiu
        j Fail_sltiu_9

    test10_sltiu:
        li   t0, 0x000000ff
        sltiu t2, t0, 0x100
        li   t3, 1
        beq  t2, t3, pass
        j Fail_sltiu_10

    pass:
        j return_sltu_test

Fail_sltu_1:
    li   gp, 401
    j    fail

Fail_sltu_2:
    li   gp, 402
    j    fail

Fail_sltu_3:
    li   gp, 403
    j    fail

Fail_sltu_4:
    li   gp, 404
    j    fail

Fail_sltu_5:
    li   gp, 405
    j    fail

Fail_sltu_6:
    li   gp, 406
    j    fail

Fail_sltu_7:
    li   gp, 407
    j    fail

Fail_sltu_8:
    li   gp, 408
    j    fail

Fail_sltu_9:
    li   gp, 409
    j    fail

Fail_sltu_10:
    li   gp, 410
    j    fail

Fail_sltiu_1:
    li   gp, 411
    j    fail

Fail_sltiu_2:
    li   gp, 412
    j    fail

Fail_sltiu_3:
    li   gp, 413
    j    fail

Fail_sltiu_4:
    li   gp, 414
    j    fail

Fail_sltiu_5:
    li   gp, 415
    j    fail

Fail_sltiu_6:
    li   gp, 416
    j    fail

Fail_sltiu_7:
    li   gp, 417
    j    fail

Fail_sltiu_8:
    li   gp, 418
    j    fail

Fail_sltiu_9:
    li   gp, 419
    j    fail

Fail_sltiu_10:
    li   gp, 420
    j    fail
