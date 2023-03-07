`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name:        Alex Boshnakov
// Date:        12/16/22
// Lab:         Final Project
// Description: This is the Forward A multiplexer module of the program
//////////////////////////////////////////////////////////////////////////////////


module FwdAMUX(
    input [31:0] qa, // input qa, 32 bits (output from Reg file)
    input [31:0] r, // input r, 32 bits (output from ALU)
    input [31:0] mr, // input mr, 32 bits (output from EXE/MEM)
    input [31:0] mdo, // input mdo, 32 bits (output from Data Memory)
    input [1:0] fwda, // input fwda, 2 bits (this is the selector) 
    
    output reg [31:0] fwda_o // output fwd, 32 bits
);
    always @(*)
    begin
        if (fwda == 2'b00)      // if fwda = 0, then use qa for output
            fwda_o <= qa;
        else if (fwda == 2'b01) // if fwda = 1, then use r for output
            fwda_o <= r;
        else if (fwda == 2'b10) // if fwda = 2, then use mr for output
            fwda_o <= mr;
        else                    // if fwda = 3, then use mdo for output
            fwda_o <= mdo;
    end
    
endmodule