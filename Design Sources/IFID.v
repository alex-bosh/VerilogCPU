`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name:        Alex Boshnakov
// Date:        12/16/22
// Lab:         Final Project
// Description: This is the IF/ID Pipeline register module of the program
//////////////////////////////////////////////////////////////////////////////////


module IFID(
    input [31:0] instOut, // input instOut, 32 bits
    input clock, // clock input
    
    output reg [31:0] dinstOut // output dinstOut, 32 bits
);
    
    always @(posedge clock)
    begin
        dinstOut = instOut; // assign instOut to output on positive clock edge
    end
    
endmodule
