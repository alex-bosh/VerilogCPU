`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name:        Alex Boshnakov
// Date:        12/16/22
// Lab:         Final Project
// Description: This is the MEM/WB Pipeline register module of the program
//////////////////////////////////////////////////////////////////////////////////


module MEMWB(
    input mwreg, // input mwreg
    input mm2reg, // input mm2reg
    input [4:0] mdestReg, // input mdestReg, 5 bits
    input [31:0] mr, // input mr, 32 bits
    input [31:0] mdo, // input mdo, 32 bits
    input clock, // clock input
    
    output reg wwreg, // output wwreg
    output reg wm2reg, // output wm2reg
    output reg [4:0] wdestReg, // output wdestReg, 5 bits
    output reg [31:0] wr, // output wr, 32 bits
    output reg [31:0] wdo // output wdo, 32 bits
);
    
    always @(posedge clock)
    begin
        wwreg <= mwreg;
        wm2reg <= mm2reg;
        wdestReg <= mdestReg;
        wr <= mr;
        wdo <= mdo;
    end
    
endmodule
