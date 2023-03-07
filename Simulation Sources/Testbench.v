`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name:        Alex Boshnakov
// Date:        12/16/22
// Lab:         Final Project
// Description: This is the testbench module of the program
//////////////////////////////////////////////////////////////////////////////////


module Testbench();
    reg clock;          // input clock
    wire [31:0] pc; // program counter output
    wire [31:0] dinstOut; // output dinstOut, from IFID module
    wire ewreg; // output ewreg
    wire em2reg; // output em2reg
    wire ewmem; // output ewmem
    wire [3:0] ealuc; // output ealuc, 4 bits
    wire ealuimm; // output ealuimm
    wire [4:0] edestReg; // output edestReg, 5 bits
    wire [31:0] eqa; // output eqa, 32 bits
    wire [31:0] eqb; // output eqb, 32 bits
    wire [31:0] eimm32; // output eimm32, 32 bits
    wire mwreg; // output mwreg
    wire mm2reg; // output mm2reg
    wire mwmem; // output mwmem
    wire [4:0] mdestReg; // output mdestReg, 5 bits
    wire [31:0] mr; // output mr, 32 bits
    wire [31:0] mqb; // output mqb, 32 bits
    wire wwreg; // output wwreg
    wire wm2reg; // output wm2reg
    wire [4:0] wdestReg; // output wdestReg, 5 bits
    wire [31:0] wr; // output wr, 32 bits
    wire [31:0] wdo; // output wdo, 32 bits
    wire [31:0] qa; // output qa, 32 bits
    wire [31:0] qb; // output qb, 32 bits
    
    
    
    wire [1:0] fwda;
    wire [1:0] fwdb;
    
    wire [31:0] wbData;
    
    Datapath Datapath_tb(clock, pc, dinstOut, ewreg, em2reg, ewmem, ealuc, ealuimm, edestReg, eqa, eqb, eimm32, 
    mwreg, mm2reg, mwmem, mdestReg, mr, mqb, wwreg, wm2reg, wdestReg, wr, wdo, qa, qb, fwda, fwdb, wbData);
    
    initial // initial block, used to initialize and change inputs
    begin
        clock = 1'b0;
    end   
    always // always block, used for the clock
    begin 
        #5;
        clock = ~clock;
    end
    
endmodule