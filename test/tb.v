`timescale 1ns/1ps

module tb;

    // TinyTapeout standard signals
    reg clk;
    reg rst_n;
    reg ena;

    reg  [7:0] ui_in;     // switches / inputs
    wire [7:0] uo_out;    // outputs
    reg  [7:0] uio_in;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;

    // Instantiate YOUR project (top module name MUST be project)
    project uut (
        .clk(clk),
        .rst_n(rst_n),
        .ena(ena),
        .ui_in(ui_in),
        .uo_out(uo_out),
        .uio_in(uio_in),
        .uio_out(uio_out),
        .uio_oe(uio_oe)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0, tb);

        // Initial values
        clk = 0;
        rst_n = 0;
        ena = 1;
        ui_in = 0;
        uio_in = 0;

        // Release reset
        #20;
        rst_n = 1;

        // -------------------------------------------------
        // Dummy stimulus (for now just toggle inputs)
        // Later we will replace with calculator tests
        // -------------------------------------------------

        #20 ui_in = 8'b00000101;
        #20 ui_in = 8'b00001010;
        #20 ui_in = 8'b00001111;
        #20 ui_in = 8'b11110000;
        #20 ui_in = 8'b10101010;

        #50;

        // Important for TinyTapeout workflow
        $display("TEST PASSED");

        #10;
        $finish;
    end

endmodule
