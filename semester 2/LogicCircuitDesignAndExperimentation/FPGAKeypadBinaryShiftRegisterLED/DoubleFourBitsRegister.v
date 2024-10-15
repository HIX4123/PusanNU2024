// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
// CREATED		"Mon Oct 14 22:05:57 2024"

module DoubleFourBitsRegister(
	CLK,
	Ce,
	RST,
	Din,
	Aout,
	Bout
);


input wire	CLK;
input wire	Ce;
input wire	RST;
input wire	[3:0] Din;
output wire	[3:0] Aout;
output wire	[3:0] Bout;

wire	[3:0] SYNTHESIZED_WIRE_0;

assign	Aout = SYNTHESIZED_WIRE_0;




FourBitsRegister	b2v_inst(
	.Ce(Ce),
	.CLK(CLK),
	.RST(RST),
	.bin(Din),
	.bout(SYNTHESIZED_WIRE_0));


FourBitsRegister	b2v_inst5(
	.Ce(Ce),
	.CLK(CLK),
	.RST(RST),
	.bin(SYNTHESIZED_WIRE_0),
	.bout(Bout));


endmodule
