`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:51:54 03/27/2015 
// Design Name: 
// Module Name:    instruc_fetch 
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
module instruction_fetch(
		input PC_sel,
		input clock,
		input [9:0]jump_address,
		output [31:0]instruc_reg,
		output [9:0]PC_plus_1
    );

wire [9:0]PC;
wire [9:0] PC_current;
	 
instruc_mem im(
  .clka(clock),
  .wea(1'b0),
  .addra(PC_current),
  .dina(0),
  .douta(instruc_reg)
);

mux_2to1 #(10) mux (
	.in_a(jump_address),
	.in_b(PC_plus_1),
	.sel(PC_sel),
	.out(PC)
    );
	 
PC pc_reg(
	.PC_new(PC),			//direccion que entra al PC, es la que sale del sumador o que viene desde un jump
	.clock(clock),
	.PC_current(PC_current)		//direccion que sale del PC, es la que va la Memoria de Instrucciones.
    );
	 
adder #(10) add_1(
	.in_a(PC_current),
	.in_b(10'b1),
   .sum(PC_plus_1)
    );
	 
endmodule
