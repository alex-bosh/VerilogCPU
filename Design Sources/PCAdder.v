`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name:        Alex Boshnakov
// Date:        12/16/22
// Lab:         Final Project
// Description: This is the Program Counter Adder module of the program
//////////////////////////////////////////////////////////////////////////////////


module PCAdder(
    input [31:0] pc, // input pc, 32 bits
    
    output reg [31:0] nextPc // output nextPc, 32 bits
);
    
    always @(*)
    begin
        nextPc = pc + 4; // the value of pc + 4 is assigned to nextPc
    end
    
endmodule
