`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name:        Alex Boshnakov
// Date:        12/16/22
// Lab:         Final Project
// Description: This is the Program Counter module of the program
//////////////////////////////////////////////////////////////////////////////////


module PC(
    input [31:0] nextPc, // input nextPc, 32 bits
    input clock, // clock input
    
    output reg [31:0] pc // output pc, 32 bits
);
    
    initial
    begin
        pc = 32'd100;
    end
    
    always @(posedge clock)
    begin
        pc = nextPc; // the value of nextPc is assigned to pc
    end
    
endmodule
