`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:55:46 09/29/2019 
// Design Name: 
// Module Name:    ControlUnit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ControlUnit(input Clock, input Reset, input [3:0] Speed, input Start, output reg Load, output reg ShiftOut);
reg [3:0] DelayCount;
reg [3:0] SentCount;
reg [1:0] State;
reg [1:0] NextState;

parameter Init = 2'd0, LoadState = 2'd1, Delay = 2'd2, Shift = 2'd3;
parameter ShiftTarget = 12;



initial SentCount = 0;



always @(posedge Clock or posedge Reset) begin
	if(Reset == 1)
		State <= Init;
	else
		State <= NextState;
end

always @(posedge Clock or posedge Reset) begin
	if(Reset == 1)
		SentCount <= 0;
	else begin
		if(State == Shift) begin
			SentCount <= SentCount + 1;
			case(Speed)
				1: DelayCount <= 0;
				default:DelayCount <= Speed - 1;
			endcase
		end
		else if(State == Delay) begin
			SentCount <= SentCount;
			DelayCount <= DelayCount -1;
		end else begin
			SentCount <= SentCount;
			DelayCount <= 0;
		end
	end


end

always @(*) begin
	case(State)
		Init: begin
				Load <= 0;
				ShiftOut <=0;
				if(Start == 1)
					NextState <= LoadState;
				else
					NextState <= Init;
			end
		
		LoadState: begin
				Load <= 1;
				ShiftOut <=0;
				NextState <= Shift;
			end
		
		Delay: begin
				Load <= 0;
				ShiftOut <=0;
				if(DelayCount == 0) begin
					NextState <= Shift;
					end
				else begin
					NextState <= Delay;
				end
			end
		
		Shift: begin
				Load <= 0;
				ShiftOut <=1;
				if(SentCount == 11) begin
					NextState <= Init;
				end else begin
					case(Speed)
						1: begin 
							NextState <= Shift;
							end
						default: begin
							NextState <=Delay;
							end
					endcase
				end
					
			end
			default: begin
				Load <= 0;
				ShiftOut <= 0;
			end
	endcase
end





endmodule
