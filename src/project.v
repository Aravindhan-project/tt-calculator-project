// TinyTapeout Calculator (Multiplier)
// inputs: ui_in[3:0]  = A
//         ui_in[7:4]  = B
// output: uo_out[7:0] = Result

module tt_um_calculator(
    input  [7:0] ui_in,
    output [7:0] uo_out
);

wire [3:0] A;
wire [3:0] B;

assign A = ui_in[3:0];
assign B = ui_in[7:4];

// multiply
assign uo_out = A * B;

endmodule
