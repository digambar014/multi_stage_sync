`timescale 1ns / 1ps

module sync_tb;

    // -------------------------------------------------
    // Testbench signals
    // -------------------------------------------------
    reg  clk;
    reg  async_in;

    wire sync_out2;
    wire sync_out3;

    // -------------------------------------------------
    // Clock generation
    // 10 ns period (100 MHz)
    // -------------------------------------------------
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // -------------------------------------------------
    // 2-stage synchronizer
    // -------------------------------------------------
    sync2_stage u_sync2 (
        .clk      (clk),
        .async_in (async_in),
        .sync_out (sync_out2)
    );

    // -------------------------------------------------
    // 3-stage synchronizer
    // -------------------------------------------------
    sync3_stage u_sync3 (
        .clk      (clk),
        .async_in (async_in),
        .sync_out (sync_out3)
    );

    // -------------------------------------------------
    // Test stimulus
    // -------------------------------------------------
    initial begin
        // Initial values
        async_in = 1'b0;

        // Allow the design to initialize
        #20;

        // Asynchronous pulse 1
        #3;
        async_in = 1'b1;

        #15;
        async_in = 1'b0;

        // Asynchronous pulse 2
        #25;
        async_in = 1'b1;

        #30;
        async_in = 1'b0;

        // Allow outputs to settle
        #50;

        // End simulation
        $finish;
    end

    // -------------------------------------------------
    // VCD waveform dump
    // Compatible with GTKWave
    // -------------------------------------------------
    initial begin
        $dumpfile("sync_tb.vcd");
        $dumpvars(0, sync_tb);
    end

endmodule

