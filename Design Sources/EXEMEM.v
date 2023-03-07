`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name:        Alex Boshnakov
// Date:        12/16/22
// Lab:         Final Project
// Description: This is the EXE/MEM Pipeline register module of the program
//////////////////////////////////////////////////////////////////////////////////


module EXEMEM(
    input ewreg, // input ewreg
    input em2reg, // input em2reg
    input ewmem, // input ewmem
    input [4:0] edestReg, // input edestReg, 5 bits
    input [31:0] r, // input r, 32 bits
    input [31:0] eqb, // input eqb, 32 bits
    input clock, // clock input
    
    output reg mwreg, // output mwreg
    output reg mm2reg, // output mm2reg
    output reg mwmem, // output mwmem
    output reg [4:0] mdestReg, // output mdestReg, 5 bits
    output reg [31:0] mr, // output mr, 32 bits
    output reg [31:0] mqb // output mqb, 32 bits
);
    
    always @(posedge clock)
    begin
        mwreg <= ewreg;
        mm2reg <= em2reg;
        mwmem <= ewmem;
        mdestReg <= edestReg;
        mr <= r;
        mqb <= eqb;
    end
    
endmodule
