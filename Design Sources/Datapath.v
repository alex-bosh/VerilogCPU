`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name:        Alex Boshnakov
// Date:        12/16/22
// Lab:         Final Project
// Description: This is the Datapath module of the program.
//////////////////////////////////////////////////////////////////////////////////


module Datapath(
    input clock, // clock input
    
    output [31:0] pc, // program counter output
    output [31:0] dinstOut, // output dinstOut, from IFID module
    
    // outputs from IDEXE module
    output ewreg, // output ewreg
    output em2reg, // output em2reg
    output ewmem, // output ewmem
    output [3:0] ealuc, // output ealuc, 4 bits
    output ealuimm, // output ealuimm
    output [4:0] edestReg, // output edestReg, 5 bits
    output [31:0] eqa, // output eqa, 32 bits
    output [31:0] eqb, // output eqb, 32 bits
    output [31:0] eimm32, // output eimm32, 32 bits
    
    // outputs from EXEMEM module
    output mwreg, // output mwreg
    output mm2reg, // output mm2reg
    output mwmem, // output mwmem
    output [4:0] mdestReg, // output mdestReg, 5 bits
    output [31:0] mr, // output mr, 32 bits
    output [31:0] mqb,
    
    // outputs from MEMWB module
    output wwreg, // output wwreg
    output wm2reg, // output wm2reg
    output [4:0] wdestReg, // output wdestReg, 5 bits
    output [31:0] wr, // output wr, 32 bits
    output [31:0] wdo, // output wdo, 32 bits
    
    output [31:0] qa, // output qa, 32 bits
    output [31:0] qb, // output qb, 32 bits
    
    
    
    output [1:0] fwda,
    output [1:0] fwdb,
    
    output [31:0] wbData
    );
    
    
    
    // declaring PC module + inputs/outputs for PC module
    wire [31:0] nextPc; // PC input nextPc, stores next value of PC address
    PC PC_DP(nextPc, clock, pc); // declaration of Program counter module
    
    // declaring PCAdder module + inputs/outputs for PC module
    PCAdder PCAdder_DP(pc, nextPc); // declaration of PC Adder module
    
    // declaring InstructMem module + inputs/outputs for InstructMem module
    wire [31:0] instOut; // InstructMem output instOut
    InstructMem InstructMem_DP(pc, instOut); // declaration of Instruction Memory module
    
    
    
    // declaring IFID module + inputs/outputs for InstructMem module
    IFID IFID_DP(instOut, clock, dinstOut); // declaration of IFID module
    
    // declaring Control Unit module + inputs/output for Control Unit module
    wire [5:0] op = dinstOut[31:26]; // CU input op, takes 6 MSB of dinstOut
    wire [5:0] funct = dinstOut[5:0]; // CU input funct, takes 6 LSB of dinstOut
    wire [4:0] rs = dinstOut[25:21]; // module input rs, takes bits 25:21 of dinstOut
    wire [4:0] rt = dinstOut[20:16]; // module input rt, takes bits 20:16 of dinstOut
    wire wreg; // CU output wreg, write register
    wire m2reg; // CU output m2reg, memory to register
    wire wmem; // CU output wmem, write memory
    wire [3:0] aluc; // CU output aluc, ALU control
    wire aluimm; // CU output aluimm, ALU immediate
    wire regrt; // CU output regrt, register rt
    //wire [1:0] fwda; // CU output fwda, selector for FwdAMUX
    //wire [1:0] fwdb; // CU output fwdb, selector for FwdBMUX
    ControlUnit ControlUnit_DP(op, funct, rs, rt, mdestReg, mm2reg, mwreg, edestReg, em2reg, ewreg, wreg, m2reg, wmem, aluc, aluimm, regrt, fwda, fwdb); // declaration of ControlUnit module
    
    // declaring RegrtMUX module + inputs/outputs for RegrtMUX module
    wire [4:0] rd = dinstOut[15:11]; // module input rd, takes bits 15:11 of dinstOut
    wire [4:0] destReg; // module output destReg, 5 bits
    RegrtMUX RegrtMUX_DP(rt, rd, regrt, destReg); // declaration of RegrtMUX module
    
    // declaring FwdAMUX module + inputs/outputs for the FwdAMUX module
    wire [31:0] r; // ALU module output r, 32 bits
    wire [31:0] mdo; // DataMem module output mdo, 32 bits
    wire [31:0] qa_a = qa; // module input qa_a, 32 bits
    wire [31:0] r_a = r; // module input r_a, 32 bits
    wire [31:0] mr_a = mr; // module input mr_a, 32 bits
    wire [31:0] mdo_a = mdo; // module input mdo_a, 32 bits
    wire [31:0] fwda_o; // module output fwda_o, 32 bits
    FwdAMUX FWDAMUX_DP(qa, r, mr, mdo, fwda, fwda_o);
    
    // declaring FwdBMUX module + inputs/outputs for the FwdBMUX module
    wire [31:0] qb_b = qb; // module input qa_b, 32 bits
    wire [31:0] r_b = r; // module input r_b, 32 bits
    wire [31:0] mr_b = mr; // module input mr_b, 32 bits
    wire [31:0] mdo_b = mdo; // module input mdo_b, 32 bits
    wire [31:0] fwdb_o; // module output fwdb_o, 32 bits
    FWDBMUX FWDBMUX_DP(qb, r, mr, mdo, fwdb, fwdb_o);
    
    // declaring Immediate Extender module + inputs/outputs of ImmedExt module
    wire [15:0] imm = dinstOut[15:0]; // module input imm, takes bits 15:0 of dinstOut
    wire [31:0] imm32; // module output imm32, 32 bits
    ImmedExt ImmedExt_DP(imm, imm32); // declaration of ImmedExt module
    
    
    
    // declaring IDEXE module + inputs/outputs of IDEXE module
    IDEXE IDEXE_DP(wreg, m2reg, wmem, aluc, aluimm, destReg, fwda_o, fwdb_o, imm32, clock, ewreg, em2reg,
        ewmem, ealuc, ealuimm, edestReg, eqa, eqb, eimm32); // declaration of IDEXE module
        
    // declaring ALUMUX module + inputs/outputs of ALUMUX module
    wire [31:0] b; // module output b, 32 bits
    ALUMUX ALUMUX_DP(eqb, eimm32, ealuimm, b);
    
    // declaring ALU module + inputs/outputs of ALU module
    ALU ALU_DP(eqa, b, ealuc, r);
    
    
    
    // declaring EXEMEM module + inputs/outputs of EXEMEM module
    EXEMEM EXEMEM_DP(ewreg, em2reg, ewmem, edestReg, r, eqb, clock, mwreg, mm2reg, mwmem, mdestReg, mr, mqb);
    
    // declaring Data Memory module + inputs/outputs of Data Memory module
    DataMem DataMem_DP(mr, mqb, mwmem, clock, mdo);
    
    
    
    // declaring MEMWB module + inputs/outputs of MEMWB module
    MEMWB MEMWB_DP(mwreg, mm2reg, mdestReg, mr, mdo, clock, wwreg, wm2reg, wdestReg, wr, wdo);
    
    // declaring WbMUX module + inputs/outputs of WbMUX module
    //wire [31:0] wbData; // module output wbData, 32 bits
    WbMUX WbMUX_DP(wr, wdo, wm2reg, wbData);
    
    // declaring RegFile module + inputs/outputs for RegFile module
    RegFile Regfile_DP(rs, rt, wdestReg, wbData, wwreg, clock, qa, qb); // declaration of RegFile module
    
endmodule
