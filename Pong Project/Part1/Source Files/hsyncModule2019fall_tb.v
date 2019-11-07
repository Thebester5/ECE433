`timescale 1ns / 1ps
//ECE433 Fall 2019
module hsyncModule2019fall_tb;

	reg PixelClock,reset, clock;
	reg [9:0] SynchPulse, BackPorch, ActiveVideo, FrontPorch;

	wire hsync, LineEnd;
	wire [9:0] xposition;
	wire PixelClockOneShot=uut.PixelClockOneShot;
	wire [9:0] xcount=uut.xcount;
//module hsyncModule2019fall #(parameter xresolution=10;)(
//input [xresolution-1:0] SynchPulse, FrontPorch, ActiveVideo, BackPorch,
//input PixelClock, reset, clock,
//output hsync, LineEnd, output reg [xresolution-1:0] xposition);

	hsyncModule2019fall uut (SynchPulse, FrontPorch, ActiveVideo, 
	BackPorch, PixelClock, reset, clock, hsync, LineEnd, xposition);

	initial begin
	PixelClock=0;   SynchPulse = 2;  BackPorch = 3;  ActiveVideo = 5;
	FrontPorch = 2;   reset = 0; clock = 0;    end
	always #1 clock=~clock;
	always #4 PixelClock=~PixelClock;
	initial fork
	#0 reset=1; 	#12 reset=0; 
   #290 $stop;
	join 
endmodule

