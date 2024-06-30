`timescale 1ns/1ps

module tb_PLL_V;

    reg clk;
    reg reset_p;
    wire pll_outclk_0;
    wire pll_locked;
    reg [63:0] reconfig_to_pll;
    wire [63:0] reconfig_from_pll;

    // Clock period
    parameter clk_period = 20;

    // Instantiate the PLL component
    D_PLL pll_inst (
        .refclk(clk),
        .rst(reset_p),
        .outclk_0(pll_outclk_0),
        .locked(pll_locked),
        .reconfig_to_pll(reconfig_to_pll),
        .reconfig_from_pll(reconfig_from_pll)
    );

    // Stimulus process
    initial begin
        // Initialize signals
        clk = 0;
        reset_p = 1;
        reconfig_to_pll = 64'd0;
        
        // Apply reset
        #100;
        reset_p = 0;

        // Wait for PLL to lock and observe the outputs
        #200;

        $finish;
    end

    // Clock process
    always begin
        #(clk_period / 2) clk = ~clk;
    end

endmodule
