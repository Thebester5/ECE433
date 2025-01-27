`timescale 1ns / 1ps
//overall controller for Transmit Test
//ECE433 Fall 2019
//this is a template
//Jianjian Song
//Update RAM address
//Each time NextAddress==1, RAMaddress is incremented by 1

module RAMAddressUpdate(NextAddress, RAMaddress, reset, clock);
parameter RAMaddressBits=6;
input NextAddress, reset, clock;
output [RAMaddressBits-1:0] RAMaddress; 

reg [RAMaddressBits-1:0] RAMaddress;
reg overflow;

always @(posedge clock) begin
	if(reset == 1)
		{overflow,RAMaddress} <= 0;
	else begin
		if(NextAddress == 0)
			{overflow,RAMaddress} <= RAMaddress;
		else
			{overflow,RAMaddress} <= RAMaddress + 1'b1;
	end
end
	

endmodule
