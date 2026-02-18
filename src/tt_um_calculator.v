module tt_um_calculator (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire ena,
    input  wire clk,
    input  wire rst_n
);

wire [3:0] A = ui_in[3:0];
wire [3:0] B = ui_in[7:4];

wire [4:0] SUM = A + B;

assign uo_out[3:0] = SUM[3:0];
assign uo_out[4]   = SUM[4];
assign uo_out[7:5] = 3'b000;

assign uio_out = 8'b00000000;
assign uio_oe  = 8'b00000000;

endmodule
