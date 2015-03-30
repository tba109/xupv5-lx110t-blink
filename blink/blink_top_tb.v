`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:14:21 03/30/2015
// Design Name:   blink_top
// Module Name:   /home/tyler/sat_erp/firmware/blink/blink/blink_top_tb.v
// Project Name:  blink
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: blink_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module blink_top_tb;

	// Inputs
	reg USER_CLK;
	reg FPGA_CPU_RESET_B;

	// Outputs
	wire GPIO_LED_N;

	// Instantiate the Unit Under Test (UUT)
	blink_top uut (
		.USER_CLK(USER_CLK), 
		.FPGA_CPU_RESET_B(FPGA_CPU_RESET_B), 
		.GPIO_LED_N(GPIO_LED_N)
	);

   // Clock generator
   localparam PERIOD = 10;
   always #(PERIOD/2) USER_CLK = ~USER_CLK;
   
   // Test
   initial begin
      // Initialize Inputs
      USER_CLK = 0;
      FPGA_CPU_RESET_B = 0;
      
      #(PERIOD*5) FPGA_CPU_RESET_B = 1'b1;
         
      // Wait for global reset to finish
      #(PERIOD*500000000);
      $finish;
      
   end
      
endmodule

