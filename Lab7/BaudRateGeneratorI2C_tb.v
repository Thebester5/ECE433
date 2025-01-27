`timescale 1ns / 1ps
//ECE433 Fall 2019
module BaudRateGeneratorI2C_tb;

	reg Enable;
	reg Reset;
	reg clock;
	reg [19:0] BaudRate;
	reg [29:0] ClockFrequency;

	wire ClockI2C;

	I2C_BaudRateGenerator uut (BaudRate,ClockFrequency,Enable,ClockI2C,, clock);

	initial begin  Enable = 0;  Reset = 0;  clock = 0;  BaudRate = 2;  ClockFrequency = 10; end
	always #4 clock = ~ clock;
	
	initial fork
	#0 Reset = 0; #12 Reset = 1; #19 Reset = 0; 
	#0 Enable = 0;  #23 Enable = 1;  #89 Enable = 0;  #120 Enable = 1;
	#300 $stop;
	join
      
endmodule

