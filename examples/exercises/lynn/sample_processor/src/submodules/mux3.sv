


module mux3 #(parameter WIDTH) (
        input   logic [WIDTH-1:0]   A,B,C,
        input   logic [1:0]         select,

        output  logic [WIDTH-1:0]   result
    );

    assign result = ~select[1] ? (~select[0] ? A : B) : C;

endmodule
