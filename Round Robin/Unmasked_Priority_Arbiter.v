`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:19:20 08/22/2014 
// Design Name: 
// Module Name:    Unmasked_Priority_Arbiter 
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
module Unmasked_Priority_Arbiter #(
		parameter width = 8
    )
	 (
		input [width-1:0] unmasked_request,
		output [width-1:0] unmasked_grant
	 );

assign unmasked_grant[0] = unmasked_request[0];
genvar index;

generate
	for(index = 1; index < width; index = index + 1)
	begin: generate_grant_signal	
		assign unmasked_grant[index] = ~unmasked_grant[index-1] && unmasked_request[index];
	end
endgenerate
	
endmodule
