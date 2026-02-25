// gotta change


//change to func3 as the input for telling what to extend as

module ext2(
        input   logic [2:0]    func3,
        input   logic [2:0]    IEUAdr210,
        input   logic [31:0]    ReadData,
        output  logic [31:0]    ImmLoad
    );

    logic [15:0] cut16;
    logic [7:0] cut8;

    assign cut16 = IEUAdr210[1] ? ReadData[31:16] :ReadData[15:0];
    assign cut8 = IEUAdr210[0] ? cut16[15:8] :cut16[7:0];

    always_comb begin
        case(func3)
            // lb
            3'b000: ImmLoad = {{24{cut8[7]}}, cut8[7:0]};
            // lh
            3'b001: ImmLoad = {{16{cut16[15]}}, cut16[15:0]};
            // lw
            3'b010: ImmLoad = ReadData;
            // lbu
            3'b100: ImmLoad = {24'b0, cut8[7:0]};
            // lhu
            3'b101: ImmLoad = {16'b0, cut16[15:0]};
            default: ImmLoad = 32'bx; // undefined
        endcase
    end
endmodule
