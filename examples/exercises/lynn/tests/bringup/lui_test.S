.extern return_lui_test
.extern fail

    .section .text.init
    .globl lui_test
    .type  lui_test, @function

lui_test:
    test1_lui:
        lui  t0, 0x12345
        li   t1, 0x12345000
        beq  t0, t1, test2_lui
        j Fail_lui_1

    test2_lui:
        lui  t0, 0xfffff
        li   t1, 0xfffff000
        beq  t0, t1, test3_lui
        j Fail_lui_2

    test3_lui:
        lui  t0, 0x00000
        li   t1, 0x00000000
        beq  t0, t1, test4_lui
        j Fail_lui_3

    test4_lui:
        lui  t0, 0xabcde
        li   t1, 0xabcde000
        beq  t0, t1, test5_lui
        j Fail_lui_4

    test5_lui:
        lui  t0, 0x80000
        li   t1, 0x80000000
        beq  t0, t1, test6_lui
        j Fail_lui_5

    test6_lui:
        lui  t0, 0x7ffff
        li   t1, 0x7ffff000
        beq  t0, t1, test7_lui
        j Fail_lui_6

    test7_lui:
        lui  t0, 0x00001
        li   t1, 0x00001000
        beq  t0, t1, test8_lui
        j Fail_lui_7

    test8_lui:
        lui  t0, 0x55555
        li   t1, 0x55555000
        beq  t0, t1, test9_lui
        j Fail_lui_8

    test9_lui:
        lui  t0, 0xaaaaa
        li   t1, 0xaaaaa000
        beq  t0, t1, test10_lui
        j Fail_lui_9

    test10_lui:
        lui  t0, 0xcafeb
        li   t1, 0xcafeb000
        beq  t0, t1, pass
        j Fail_lui_10

    pass:
        j return_lui_test

Fail_lui_1:
    li   gp, 1301
    j    fail

Fail_lui_2:
    li   gp, 1302
    j    fail

Fail_lui_3:
    li   gp, 1303
    j    fail

Fail_lui_4:
    li   gp, 1304
    j    fail

Fail_lui_5:
    li   gp, 1305
    j    fail

Fail_lui_6:
    li   gp, 1306
    j    fail

Fail_lui_7:
    li   gp, 1307
    j    fail

Fail_lui_8:
    li   gp, 1308
    j    fail

Fail_lui_9:
    li   gp, 1309
    j    fail

Fail_lui_10:
    li   gp, 1310
    j    fail
