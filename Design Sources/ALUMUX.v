`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name:        Alex Boshnakov
// Date:        12/16/22
// Lab:         Final Project
// Description: This is the ALU multiplexer module of the program
//////////////////////////////////////////////////////////////////////////////////


module ALUMUX(
    input [31:0] eqb, // input eqb, 32 bits
    input [31:0] eimm32, // input eimm32, 32 bits
    input ealuimm, // input ealuimm, 1 bit
    
    output reg [31:0] b // output b, 32 bits
);
    always @(*)
    begin
        if (ealuimm == 1'b0) // if ealuimm = 0, then use eqb for output
            b <= eqb;
        else                    // if ealuimm = 1, then use eimm32 for output
            b <= eimm32;
    end
    
endmodule
