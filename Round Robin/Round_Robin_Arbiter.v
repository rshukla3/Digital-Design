`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:59:30 08/22/2014 
// Design Name: 
// Module Name:    Round_Robin_Arbiter 
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
module Round_Robin_Arbiter #
(
	parameter width = 8
)
(
	input clk,
	input rst_n,
	input [width-1:0] request,
	
	output [width-1:0] grant
 );

	wire [width-1:0] masked_request;
	wire [width-1:0] masked_grant;
	
	wire [width-1:0] unmasked_request;
	wire [width-1:0] unmasked_grant;
	
	wire [width-1:0] mask_generated; 
	
	Mask_Logic #(width)
	maskLogic(.clk(clk),
					.rst_n(rst_n),
					.grant(grant),
					.mask_generated(mask_generated)
					);
					
	Masked_Priority_Arbiter #(width)
	MPA(.masked_request(masked_request),
			.masked_grant(masked_grant));
		
	Unmasked_Priority_Arbiter #(width)
	UMPA(.unmasked_request(unmasked_request),
			.unmasked_grant(unmasked_grant));
	
	assign masked_request = mask_generated && request;
	assign unmasked_request = request;
	assign grant = ((mask_generated && request) == 0) ? unmasked_grant : masked_grant;
	
endmodule
