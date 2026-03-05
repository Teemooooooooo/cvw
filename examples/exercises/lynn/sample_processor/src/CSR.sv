//CSR.sv
//ellyu@g.hmc.edu

module CSR(
    input   logic           reset, clk,
    input   logic           IsAdd, IsBranch, IsBranchTaken, IsJump, IsStore, IsLoad, IsLui, IsAuipc,
    input   logic [11:0]    CSRAddress,
    output  logic [31:0]    CSRout
    );

    //logic [31:0] rf;
    logic [63:0] rdcycle, rdtime, rdinsret;
    logic [63:0] hpm3, hpm4, hpm5, hpm6, hpm7, hpm8, hpm9, hpm10;

    always_ff @(posedge clk)
        begin
            if (reset)
            begin
                rdcycle <= 64'b0;
                rdtime  <= 64'b0;
                rdinsret<= 64'b0;
                hpm3    <= 64'b0;
                hpm4    <= 64'b0;
                hpm5    <= 64'b0;
                hpm6    <= 64'b0;
                hpm7    <= 64'b0;
                hpm8    <= 64'b0;
                hpm9    <= 64'b0;
                hpm10   <= 64'b0;
            end
            else
            begin
                rdcycle <= rdcycle + 1;
                rdtime  <= rdtime + 1;
                //WHATTT if (flag_pc_changed)
                    rdinsret <= rdinsret + 1;
                // wait so confused isnt number of cycles and instructions retired da same
                hpm3    <= hpm3 + {{31{1'b0}}, IsAdd};
                hpm4    <= hpm4 + {{31{1'b0}}, IsBranch};
                hpm5    <= hpm5 + {{31{1'b0}}, IsBranchTaken};
                hpm6    <= hpm6 + {{31{1'b0}}, IsJump};
                hpm7    <= hpm7 + {{31{1'b0}}, IsStore};
                hpm8    <= hpm8 + {{31{1'b0}}, IsLoad}; //not Upper ones
                hpm9    <= hpm9 + {{31{1'b0}}, IsLui};
                hpm10   <= hpm10 + {{31{1'b0}}, IsAuipc};
            end
        end

    always_comb begin
        case(CSRAddress)
        // determine output based on input address
            12'hC00: CSRout = rdcycle[31:0];
            12'hC80: CSRout = rdcycle[63:32];
            12'hC01: CSRout = rdtime[31:0];
            12'hC81: CSRout = rdtime[63:32];
            12'hC02: CSRout = rdinsret[31:0];
            12'hC82: CSRout = rdinsret[63:32];
            12'hC03: CSRout = hpm3[31:0];
            12'hC83: CSRout = hpm3[63:32];
            12'hC04: CSRout = hpm4[31:0];
            12'hC84: CSRout = hpm4[63:32];
            12'hC05: CSRout = hpm5[31:0];
            12'hC85: CSRout = hpm5[63:32];
            12'hC06: CSRout = hpm6[31:0];
            12'hC86: CSRout = hpm6[63:32];
            12'hC07: CSRout = hpm7[31:0];
            12'hC87: CSRout = hpm7[63:32];
            12'hC08: CSRout = hpm8[31:0];
            12'hC88: CSRout = hpm8[63:32];
            12'hC09: CSRout = hpm9[31:0];
            12'hC89: CSRout = hpm9[63:32];
            12'hC0A: CSRout = hpm10[31:0];
            12'hC8A: CSRout = hpm10[63:32];
        endcase
    end
endmodule
