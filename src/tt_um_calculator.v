module tt_um_calculator (
    input  wire clk,
    input  wire rst_n,
    input  wire ena,
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe
);

assign uio_out = 8'b0;
assign uio_oe  = 8'b0;

wire [3:0] A = ui_in[3:0];
wire [3:0] B = ui_in[7:4];

reg [7:0] result;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        result <= 0;
    else begin
        case(uio_in[1:0])
            2'b00: result <= A + B;
            2'b01: result <= A - B;
            2'b10: result <= A * B;
            2'b11: result <= A & B;
        endcase
    end
end

assign uo_out = result;

endmodule
