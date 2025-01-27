`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Brendan Mulholland Issac Lau
// 
// Create Date:    18:10:33 10/20/2019 
// Design Name: 
// Module Name:    I2C_ShiftRegister 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: A parameterized shift register
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module I2C_ShiftRegister(
    input Load,
    input ShiftorHold,
    input Reset,
    input CLOCK,
    input ShiftIn,
    output ShiftOut,
    input [LENGTH -1 :0] ParallelIn,
    output [LENGTH -1 :0] ParallelOut
    );
	 
	 parameter LENGTH = 8;
	 
	 reg [LENGTH -1 :0] ShiftRegister;
	 
		assign ShiftOut = ShiftRegister[LENGTH-1];
		assign ParallelOut = ShiftRegister;

		always @ (posedge CLOCK)
			if(Reset==1)	ShiftRegister <= 0;
			else
			if(Load==1)	//parallel load
			ShiftRegister <= ParallelIn;
			else
		case (ShiftorHold)
			1'b1:	ShiftRegister <= {ShiftRegister[LENGTH-2:0],ShiftIn};	
			default: ShiftRegister <= ShiftRegister;	// hold
		endcase
endmodule

