`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:39:58 08/22/2014 
// Design Name: 
// Module Name:    Masked__Priority_Arbiter 
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
module Masked_Priority_Arbiter #(
		parameter width = 8
    )
	 (
		input [width-1:0] masked_request,
		output [width-1:0] masked_grant
	 );

assign masked_grant[0] = masked_request[0];
genvar index;

generate
	for(index = 1; index < width; index = index + 1)
	begin: generate_grant_signal	
		assign masked_grant[index] = ~masked_grant[index-1] && masked_request[index];
	end
endgenerate
	
endmodule
