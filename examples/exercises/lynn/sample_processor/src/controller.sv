// riscvsingle.sv
// RISC-V single-cycle processor
// David_Harris@hmc.edu 2020

`include "parameters.svh"

module controller(
        input   logic [1:0]   IEUAdr,
        input   logic [6:0]   Op,
        input   logic         Lt, Eq,
        input   logic [2:0]   Funct3,
        input   logic         Funct7b5,
        output  logic         ALUResultSrc,
        output  logic [1:0]   ResultSrc,
        output  logic [3:0]   WriteByteEn,
        output  logic         PCSrc,
        output  logic         RegWrite,
        output  logic [1:0]   ALUSrc,
        output  logic [2:0]   ImmSrc,
        output  logic [1:0]   ALUControl,
        output  logic         MemEn,
        output  logic         IsAdd, IsBranch, IsBranchTaken, IsJump, IsStore, IsLoad, IsLui, IsAuipc
    `ifdef DEBUG
        , input   logic [31:0]  insn_debug
    `endif
    );
    logic Flag;

    logic Branch, Jump;
    logic Sub, ALUOp;
    logic MemWrite;
    logic [13:0] controls;




    // Main decoder
    always_comb
        case(Op)
            // RegWrite_ImmSrc_ALUSrc_ALUOp_ALUResultSrc_MemWrite_ResultSrc_Branch_Jump_Load
            7'b0000011: controls = 14'b1_000_01_0_0_0_01_0_0_1; // lw
            7'b0100011: controls = 14'b0_001_01_0_0_1_00_0_0_1; // sw
            7'b0110011: controls = 14'b1_000_00_1_0_0_00_0_0_0; // R-type
            7'b0010011: controls = 14'b1_000_01_1_0_0_00_0_0_0; // I-type ALU
            7'b1100011: controls = 14'b0_010_11_0_0_0_00_1_0_0; // b-type
            7'b1101111: controls = 14'b1_011_11_0_1_0_00_0_1_0; // jal
            7'b1100111: controls = 14'b1_000_01_0_1_0_00_0_1_0; // jalr
            7'b0110111: controls = 14'b1_111_00_0_0_0_10_0_0_0; // lui
            7'b0010111: controls = 14'b1_111_11_0_0_0_00_0_0_0; // auipc
            7'b1110011: controls = 14'b1_000_00_0_0_0_11_0_0_0; // CSR
            default: begin
                `ifdef DEBUG
                    controls = 14'bx_xxx_xx_x_x_x_xx_x_x_x; // non-implemented instruction
                    if ((insn_debug !== 'x)) begin
                        $display("Instruction not implemented: %h", insn_debug);
                        $finish(-1);
                    end
                `else
                    controls = 14'b0; // non-implemented instruction
                `endif
            end
        endcase

    assign {RegWrite, ImmSrc, ALUSrc, ALUOp, ALUResultSrc, MemWrite,
        ResultSrc, Branch, Jump, MemEn} = controls;

    // ALU Control Logic
    assign Sub = ALUOp & ((Funct3 == 3'b000) & Funct7b5 & Op[5] | (Funct3 == 3'b010)); // subtract or SLT
    //assign Sub = ALUOp & ((Funct3 == 3'b000) & Funct7b5 & Op[5]);
    assign ALUControl = {Sub, ALUOp};

    // PCSrc logic

    always_comb
    begin
        case(Funct3[2:1])
            2'b00: Flag = (Funct3[0] ^ Eq);
            2'b10: Flag = (Funct3[0] ^ Lt);
            2'b11: Flag = (Funct3[0] ^ Lt);
            default: Flag = 0;
        endcase
    end

    assign PCSrc = Branch & Flag | Jump;

    assign IsAdd = (!((Funct7b5) | (&Funct3))) & (Op == 7'b0110011);
    assign IsBranch = Branch;
    assign IsBranchTaken = Branch & Flag;
    assign IsJump = Jump;
    assign IsStore = (Op == 7'b0100011);
    assign IsLoad = (Op == 7'b0000011);
    assign IsLui = (Op == 7'b0110111);
    assign IsAuipc = (Op == 7'b0010111);
    // MemWrite logic
    //assign WriteByteEn = {(4){MemWrite}}; // currently assigns all 4 bytes to MemWrite

    always_comb begin
        WriteByteEn = 4'b0000;

        if (MemWrite === 1'b1) begin
            casez ({Funct3[1:0], IEUAdr})
                4'b10_??: WriteByteEn = 4'b1111; // sw
                4'b01_0?: WriteByteEn = 4'b0011; // sh
                4'b01_1?: WriteByteEn = 4'b1100;
                4'b00_00: WriteByteEn = 4'b0001; // sb
                4'b00_01: WriteByteEn = 4'b0010;
                4'b00_10: WriteByteEn = 4'b0100;
                4'b00_11: WriteByteEn = 4'b1000;
            endcase
        end
    end
endmodule
