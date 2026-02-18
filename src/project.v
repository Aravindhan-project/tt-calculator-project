// TinyTapeout top module
module project (
    input  wire clk,
    input  wire rst_n,
    input  wire ena,
    input  wire [7:0] ui_in,
    output reg  [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe
);

    // Not using bidirectional pins
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    reg [3:0] A;
    reg [3:0] B;
    reg [7:0] result;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            uo_out <= 0;
        end else if (ena) begin
            // Split input switches into two numbers
            A = ui_in[3:0];
            B = ui_in[7:4];

            // Simple calculator: ADD
            result = A + B;

            uo_out <= result;
        end
    end

endmodule

