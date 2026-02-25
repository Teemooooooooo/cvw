// jalr_test
// Ellen Yu
// ellyu@hmc.edu
// 2/8/2026

.extern return_jalr_test
.extern fail

.section .text.init
.globl jalr_test
.type  jalr_test, @function

jalr_test:

############################
# Test 1: basic jalr jump + link (rd=t1)
############################
test1_jalr:
    # t3 = address of j1
    lui  t3, %hi(j1)
    addi t3, t3, %lo(j1)

    # t2 = expected return address = after_jalr1
    lui  t2, %hi(after_jalr1)
    addi t2, t2, %lo(after_jalr1)

    # jump to j1, save return addr into t1
    jalr t1, 0(t3)

after_jalr1:
    # If we get here, jalr didn't jump
    jal  x0, Fail_j_1

j1:
    beq  t1, t2, test2_jalr
    jal  x0, Fail_rd_1


############################
# Test 2: negative offset (-4) landing (rd=t4)
############################
test2_jalr:
    # base = landing2 + 4, then jalr rd, -4(base) -> landing2
    lui  t5, %hi(landing2)
    addi t5, t5, %lo(landing2)
    addi t5, t5, 4

    # expected return address = after_jalr2
    lui  t6, %hi(after_jalr2)
    addi t6, t6, %lo(after_jalr2)

    jalr t4, -4(t5)

after_jalr2:
    jal  x0, Fail_j_2

landing2:
    beq  t4, t6, test3_jalr
    jal  x0, Fail_rd_2


############################
# Test 3: odd target address (LSB cleared) (rd=t1)
############################
test3_jalr:
    # t3 = address of landing3 + 1 (odd). jalr must clear bit0.
    lui  t3, %hi(landing3)
    addi t3, t3, %lo(landing3)
    addi t3, t3, 1

    # expected return address = after_jalr3
    lui  t2, %hi(after_jalr3)
    addi t2, t2, %lo(after_jalr3)

    jalr t1, 0(t3)

after_jalr3:
    jal  x0, Fail_j_3

landing3:
    beq  t1, t2, test4_jalr
    jal  x0, Fail_rd_3


############################
# Test 4: rd = x0 (no link write), ensure other reg unchanged
############################
test4_jalr:
    # set t1 to a known value; jalr with rd=x0 must NOT change t1
    addi t1, x0, 77

    # t3 = address of landing4
    lui  t3, %hi(landing4)
    addi t3, t3, %lo(landing4)

    jalr x0, 0(t3)

after_jalr4:
    jal  x0, Fail_j_4

landing4:
    addi t2, x0, 77
    beq  t1, t2, test5_jalr
    jal  x0, Fail_rd_4


############################
# Test 5: rd and rs1 are same register (t2) (rd=t2, rs1=t2)
############################
test5_jalr:
    # t2 = address of landing5 (also rs1)
    lui  t2, %hi(landing5)
    addi t2, t2, %lo(landing5)

    # expected return address = after_jalr5 (goes in t6)
    lui  t6, %hi(after_jalr5)
    addi t6, t6, %lo(after_jalr5)

    # jalr uses old t2 as target; then writes link into t2
    jalr t2, 0(t2)

after_jalr5:
    jal  x0, Fail_j_5

landing5:
    beq  t2, t6, test6_jalr
    jal  x0, Fail_rd_5


############################
# Test 6: positive offset (+8) landing (rd=t4)
############################
test6_jalr:
    # base = landing6 - 8, then jalr rd, +8(base) -> landing6
    lui  t5, %hi(landing6)
    addi t5, t5, %lo(landing6)
    addi t5, t5, -8

    # expected return address = after_jalr6
    lui  t6, %hi(after_jalr6)
    addi t6, t6, %lo(after_jalr6)

    jalr t4, 8(t5)

after_jalr6:
    jal  x0, Fail_j_6

landing6:
    beq  t4, t6, test7_jalr
    jal  x0, Fail_rd_6


############################
# Test 7: max positive imm (2047) landing (rd=t1)
############################
test7_jalr:
    # base = landing7 - 2047, then jalr rd, 2047(base) -> landing7
    lui  t3, %hi(landing7)
    addi t3, t3, %lo(landing7)
    addi t3, t3, -2047

    # expected return address = after_jalr7
    lui  t2, %hi(after_jalr7)
    addi t2, t2, %lo(after_jalr7)

    jalr t1, 2047(t3)

after_jalr7:
    jal  x0, Fail_j_7

landing7:
    beq  t1, t2, test8_jalr
    jal  x0, Fail_rd_7


############################
# Test 8: max negative imm (-2048) landing (rd=t4)
############################
test8_jalr:
    # base = landing8 + 2048, then jalr rd, -2048(base) -> landing8
    # NOTE: cannot do addi +2048 (out of range). Do 2047 + 1.
    lui  t5, %hi(landing8)
    addi t5, t5, %lo(landing8)
    addi t5, t5, 2047
    addi t5, t5, 1

    # expected return address = after_jalr8
    lui  t6, %hi(after_jalr8)
    addi t6, t6, %lo(after_jalr8)

    jalr t4, -2048(t5)

after_jalr8:
    jal  x0, Fail_j_8

landing8:
    beq  t4, t6, test9_jalr
    jal  x0, Fail_rd_8


############################
# Test 9: rd = ra (x1) link register write
############################
test9_jalr:
    # t3 = address of landing9
    lui  t3, %hi(landing9)
    addi t3, t3, %lo(landing9)

    # t2 = expected return address = after_jalr9
    lui  t2, %hi(after_jalr9)
    addi t2, t2, %lo(after_jalr9)

    # write link into ra (x1)
    jalr x1, 0(t3)

after_jalr9:
    jal  x0, Fail_j_9

landing9:
    beq  x1, t2, test10_jalr
    jal  x0, Fail_rd_9


############################
# Test 10: odd base address still lands correctly (LSB cleared) (rd=t1)
############################
test10_jalr:
    # t3 = address of landing10 + 1 (odd). jalr must clear bit0.
    lui  t3, %hi(landing10)
    addi t3, t3, %lo(landing10)
    addi t3, t3, 1

    # expected return address = after_jalr10
    lui  t2, %hi(after_jalr10)
    addi t2, t2, %lo(after_jalr10)

    jalr t1, 0(t3)

after_jalr10:
    jal  x0, Fail_j_10

landing10:
    beq  t1, t2, pass
    jal  x0, Fail_rd_10


############################
# Landing labels (targets)
############################
# (They are already placed inline above where used.)
# Keep as-is; assembler resolves addresses.


############################
# PASS / FAILS
############################
pass:
    jal  x0, return_jalr_test


Fail_j_1:
    addi gp, x0, 1501
    jal  x0, fail
Fail_rd_1:
    addi gp, x0, 1502
    jal  x0, fail

Fail_j_2:
    addi gp, x0, 1503
    jal  x0, fail
Fail_rd_2:
    addi gp, x0, 1504
    jal  x0, fail

Fail_j_3:
    addi gp, x0, 1505
    jal  x0, fail
Fail_rd_3:
    addi gp, x0, 1506
    jal  x0, fail

Fail_j_4:
    addi gp, x0, 1507
    jal  x0, fail
Fail_rd_4:
    addi gp, x0, 1508
    jal  x0, fail

Fail_j_5:
    addi gp, x0, 1509
    jal  x0, fail
Fail_rd_5:
    addi gp, x0, 1510
    jal  x0, fail

Fail_j_6:
    addi gp, x0, 1511
    jal  x0, fail
Fail_rd_6:
    addi gp, x0, 1512
    jal  x0, fail

Fail_j_7:
    addi gp, x0, 1513
    jal  x0, fail
Fail_rd_7:
    addi gp, x0, 1514
    jal  x0, fail

Fail_j_8:
    addi gp, x0, 1515
    jal  x0, fail
Fail_rd_8:
    addi gp, x0, 1516
    jal  x0, fail

Fail_j_9:
    addi gp, x0, 1517
    jal  x0, fail
Fail_rd_9:
    addi gp, x0, 1518
    jal  x0, fail

Fail_j_10:
    addi gp, x0, 1519
    jal  x0, fail
Fail_rd_10:
    addi gp, x0, 1520
    jal  x0, fail
