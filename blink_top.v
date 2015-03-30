`timescale 1ns /1ns

module blink_top
  (
   input USER_CLK, // 100MHz user clock on AH15
   input FPGA_CPU_RESET_B, // active low push button reset
   output GPIO_LED_N // active high green LED
   );

   config_ind CONFIG_IND0(
			  .clk(USER_CLK),
			  .rst_n(FPGA_CPU_RESET_B),
			  .blink_configed(GPIO_LED_N)
			  );
   
endmodule
