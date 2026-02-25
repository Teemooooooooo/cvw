// riscvsingle.sv
// RISC-V single-cycle processor
// David_Harris@hmc.edu 2020

module datapath(
        input   logic           clk, reset,
        input   logic [2:0]     Funct3,
        input   logic           ALUResultSrc,
        input   logic [1:0]     ResultSrc,
        input   logic [1:0]     ALUSrc,
        input   logic           RegWrite,
        input   logic [2:0]     ImmSrc,
        input   logic [1:0]     ALUControl,
        output  logic           Eq, Lt,
        input   logic [31:0]    PC, PCPlus4,
        input   logic [31:0]    Instr,
        output  logic [31:0]    IEUAdr, WriteData,
        input   logic [31:0]    ReadData
    );

    logic [31:0] ImmExt;
    logic [31:0] R1, R2, SrcA, SrcB;
    logic [31:0] ALUResult, IEUResult, Result, ImmLoad;

    // register file logic
    regfile rf(.reset, .clk, .WE3(RegWrite), .A1(Instr[19:15]), .A2(Instr[24:20]),
        .A3(Instr[11:7]), .WD3(Result), .RD1(R1), .RD2(R2));

    extend ext(.Instr(Instr[31:7]), .ImmSrc, .ImmExt);

    // ALU logic
    cmp cmp(.R1, .R2, .unsignedCmp(Funct3[1]), .Eq, .Lt);

    mux2 #(32) srcamux(R1, PC, ALUSrc[1], SrcA);
    mux2 #(32) srcbmux(R2, ImmExt, ALUSrc[0], SrcB);

    alu alu(.SrcA, .SrcB, .ALUControl, .Op(Instr[6:0]), .Funct3, .ALUResult, .IEUAdr, .Funct7(Instr[31:25]));

    mux2 #(32) ieuresultmux(ALUResult, PCPlus4, ALUResultSrc, IEUResult);
    mux3 #(32) resultmux(IEUResult, ImmLoad, ImmExt, ResultSrc, Result);

    ext2 ext2(Funct3, IEUAdr[2:0], ReadData, ImmLoad);
    //assign WriteData = R2;
    always_comb
    begin
        case(Funct3[1:0])
            2'b10: WriteData = R2;
            2'b01: WriteData = {R2[15:0], R2[15:0]};
            2'b00: WriteData = {4{R2[7:0]}};
            default: WriteData = 32'b0;
        endcase
    end
endmodule
