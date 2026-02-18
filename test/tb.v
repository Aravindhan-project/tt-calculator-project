`timescale 1ns/1ps

module tb;

    reg clk = 0;
    reg rst_n = 0;
    reg [7:0] ui_in;
    wire [7:0] uo_out;

    // Clock generation
    always #10 clk = ~clk;

    // DUT
    tt_um_calculator dut (
        .clk(clk),
        .rst_n(rst_n),
        .ui_in(ui_in),
        .uo_out(uo_out),
        .uio_in(8'b0),
        .uio_out(),
        .uio_oe()
    );

    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0, tb);

        // Reset
        rst_n = 0;
        #50;
        rst_n = 1;

        // Test 3 + 5 = 8
        ui_in = 8'b0101_0011;
        #100;

        // Test 7 + 8 = 15
        ui_in = 8'b1000_0111;
        #100;

        // Test 15 + 15 = 30
        ui_in = 8'b1111_1111;
        #100;

        $finish;
    end

endmodule

