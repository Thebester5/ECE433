// File name	: UniversalCounter2019fall.v
// Written by	: Jianjian Song
// ECE433 Fall 2019
// 4-bit universal bidirectional counter
`timescale 1ns / 1ps

module UniversalCounter2019fall #(parameter	length = 10) (
input	[length-1:0] P,BeginCount, EndCount, 
input S1,S0,Reset, CLOCK,
output 	reg [length-1:0]	Q,
output reg TerminalCount);
//TerminalCount=1 when the counter wraps around

reg	[length-1:0]	NextQ;

always @ (posedge CLOCK or posedge Reset)
	if(Reset==1)	Q <= BeginCount;
	else	Q<=NextQ;

always@(Q or S1 or S0 or P or EndCount or BeginCount)
	case ({S1,S0})
	2'b00:	begin NextQ <= Q;	TerminalCount<=0; end // hold
	2'b01:	begin if (Q>=EndCount) begin TerminalCount<=1; NextQ<=0; end
		else begin TerminalCount<=0; NextQ <= Q+1'b1;	end
		end // count up
	2'b10:	begin if (Q==BeginCount) begin TerminalCount<=1; NextQ<=EndCount; end
		else begin TerminalCount<=0; NextQ <= Q-1'b1;	end
		end // count down
	2'b11:	begin NextQ <= P; TerminalCount<=1'b0; end				// parallel load
	endcase
endmodule
