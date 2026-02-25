//Lab 2 - tests
//Ellen Yu
//ellyu@hmc.edu
//02/08/2026

.extern add_test
.extern and_test
.extern sub_test
.extern or_test

.extern sll_test
.extern srl_test
.extern sra_test
.extern sltu_test

.extern lb_test
.extern lh_test
.extern sb_test
.extern sh_test

.extern bne_test
.extern blt_test
.extern bge_test
.extern jalr_test

.extern lui_test
.extern auipc_test



    .section .text.init
    .globl main

    .globl return_add_test
    .globl return_and_test
    .globl return_sub_test
    .globl return_or_test

    .globl return_sll_test
    .globl return_srl_test
    .globl return_sra_test
    .globl return_sltu_test
    .globl return_jalr_test


    .globl return_lb_test
    .globl return_lh_test
    .globl return_sb_test
    .globl return_sh_test

    .globl return_bne_test
    .globl return_blt_test
    .globl return_bge_test

    .globl return_lui_test
    .globl return_auipc_test
    .type  main, @function

main:

    j add_test
return_add_test:
    j and_test
return_and_test:
    j sub_test
return_sub_test:
    j or_test
return_or_test:
    j lb_test
return_lb_test:
    j lh_test
return_lh_test:
    j sb_test
return_sb_test:
    j sh_test
return_sh_test:

    j jalr_test
return_jalr_test:
    j bne_test
return_bne_test:
    j blt_test
return_blt_test:
    j bge_test
return_bge_test:


    j lui_test
return_lui_test:
    j auipc_test
return_auipc_test:


    j sll_test
return_sll_test:
    j srl_test
return_srl_test:
    j sra_test
return_sra_test:
    j sltu_test
return_sltu_test:

    j pass
