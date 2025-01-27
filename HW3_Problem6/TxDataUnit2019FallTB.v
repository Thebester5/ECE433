`timescale 1ns / 1ps
module TxDataUnit2019FallTB;

	reg Load, Parity, ShiftOut, Reset, Clock;
	reg [8:0] Data;
	wire Tx;
	wire [11:0] ShiftRegister=uut.ShiftRegister;

	TxDataUnit2019Fall uut (.Load(Load), .Data(Data), .Parity(Parity), .Tx(Tx),
	.ShiftOut(ShiftOut), .Reset(Reset), .Clock(Clock));

	initial begin Load = 0; Data = 0; Parity = 0; ShiftOut = 0; Reset = 0; Clock = 0; end
   always #3 Clock=~Clock;
	initial fork
	#0	Load = 0;  #21	Load = 1;   #32	Load = 0;  #56	Load = 0; #152	Load = 1;   #165	Load = 0;
	#0	Data = 8'b101010101;   #56	Data = 8'b111100010;
	#0	Parity = 1;  #34	Parity = 1;   #78	Parity = 0;  #134	Parity = 1;
	#0	ShiftOut = 0;  	#38	ShiftOut = 1;   	#148	ShiftOut = 0;  #167	ShiftOut = 1;
	 #284	ShiftOut = 0;
	#0	Reset = 1;   	#12	Reset = 0;
	#300 $stop;
	join
	
endmodule

