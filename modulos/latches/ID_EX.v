`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:44:45 04/24/2015 
// Design Name: 
// Module Name:    ID_EX 
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
module ID_EX(  input enable,
					input reset,
					input [3:0] EX_control_in,
					input [1:0] M_control_in,
					input [1:0] WB_control_in,
					input [31:0] bus_a_in,
					input [31:0] bus_b_in,
					input [31:0] immed_ext_in,
					input [31:0] instruc_in,
					output reg [3:0] EX_control_out,
					output reg [1:0] M_control_out,
					output reg [1:0] WB_control_out,
					output reg [31:0] bus_a_out,
					output reg [31:0] bus_b_out,
					output reg [31:0] immed_ext_out,
					output reg [31:0] instruc_out
    );

always@(enable or reset or EX_control_in or M_control_in or WB_control_in or bus_a_in or bus_b_in or immed_ext_in or instruc_in)
begin
	if(!reset)
	begin
	EX_control_out <= 0;
	M_control_out <= 0;
	WB_control_out <= 0;
	bus_a_out <= 0;
	bus_b_out <= 0;
	immed_ext_out <= 0;
	instruc_out <= 0;
	end
	else
		if(enable)
		begin
			EX_control_out <= EX_control_in;
			M_control_out <= M_control_in;
			WB_control_out <= WB_control_in;
			bus_a_out <= bus_a_in;
			bus_b_out <= bus_b_in;
			immed_ext_out <= immed_ext_in;
			instruc_out <= instruc_in;
		end
end
endmodule
