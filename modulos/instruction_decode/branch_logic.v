`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:33:54 04/17/2015 
// Design Name: 
// Module Name:    branch_logic 
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
module branch_logic(
							input [1:0] DE_control,
							input cmp,
							output PC_sel
							);

assign PC_sel = ((DE_control[0] ~^ cmp) & DE_control[1]);
endmodule