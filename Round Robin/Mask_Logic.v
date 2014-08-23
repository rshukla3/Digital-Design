`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:18:38 08/22/2014 
// Design Name: 
// Module Name:    Mask_Logic 
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
module Mask_Logic #(
		parameter width = 8
    )
	 (
		input clk,
		input rst_n,
		input [width-1:0] grant,
		
		output reg [width-1:0] mask_generated
	 );

	
	
	always @(posedge clk)
	begin
		if(!rst_n)
		begin
			mask_generated <= 8'd0;
		end
		else begin
			if(grant[0])
				mask_generated <= {{7{1'b1}},1'b0};
			else if(grant[1])
				mask_generated <= {{6{1'b1}},{2{1'b0}}};
			else if(grant[2])
				mask_generated <= {{5{1'b1}},{3{1'b0}}};
			else if(grant[3])
				mask_generated <= {{4{1'b1}},{4{1'b0}}};
			else if(grant[4])
				mask_generated <= {{3{1'b1}},{5{1'b0}}};
			else if(grant[5])
				mask_generated <= {{2{1'b1}},{6{1'b0}}};
			else if(grant[6])
				mask_generated <= {{1{1'b1}},{7{1'b0}}};
			else
				mask_generated <= 8'd0;
		end
	end
endmodule
