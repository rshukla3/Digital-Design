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

	assign masked_grant = (masked_request[0]) ? {{7{1'b0}},masked_request[0]} : (masked_request[1]) ? {{6{1'b0}},masked_request[1:0]} : (masked_request[2]) ? {{5{1'b0}},masked_request[2:0]} : ;
endmodule
