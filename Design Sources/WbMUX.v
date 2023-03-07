`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name:        Alex Boshnakov
// Date:        12/16/22
// Lab:         Final Project
// Description: This is the Writeback multiplexer module of the program
//////////////////////////////////////////////////////////////////////////////////


module WbMUX(
    input [31:0] wr, // input wr, 32 bits
    input [31:0] wdo, // input wdo, 32 bits
    input wm2reg, // input wm2reg, 1 bit
    
    output reg [31:0] wbData // output wbData, 32 bits
);
    always @(*)
    begin
        if (wm2reg == 1'b0) // if wm2reg = 0, then use wr for output
            wbData <= wr;
        else                    // if wm2reg = 1, then use wdo for output
            wbData <= wdo;
    end
    
endmodule
