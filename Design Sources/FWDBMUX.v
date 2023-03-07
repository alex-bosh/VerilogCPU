`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name:        Alex Boshnakov
// Date:        12/16/22
// Lab:         Final Project
// Description: This is the Forward B multiplexer module of the program
//////////////////////////////////////////////////////////////////////////////////


module FWDBMUX(
    input [31:0] qb, // input qb, 32 bits (output from Reg file)
    input [31:0] r, // input r, 32 bits (output from ALU)
    input [31:0] mr, // input mr, 32 bits (output from EXE/MEM)
    input [31:0] mdo, // input mdo, 32 bits (output from Data Memory)
    input [1:0] fwdb, // input fwdb, 2 bits (this is the selector) 
    
    output reg [31:0] fwdb_o // output fwd, 32 bits
);
    always @(*)
    begin
        if (fwdb == 2'b00)      // if fwdb = 0, then use qa for output
            fwdb_o <= qb;
        else if (fwdb == 2'b01) // if fwdb = 1, then use r for output
            fwdb_o <= r;
        else if (fwdb == 2'b10) // if fwdb = 2, then use mr for output
            fwdb_o <= mr;
        else                    // if fwdb = 3, then use mdo for output
            fwdb_o <= mdo;
    end
    
endmodule