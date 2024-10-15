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
// CREATED		"Mon Oct 14 22:05:44 2024"

module FPGAKeypadBinaryShiftRegisterLED(
	CLK,
	RST,
	Keypad,
	LED1,
	LED2
);


input wire	CLK;
input wire	RST;
input wire	[11:0] Keypad;
output wire	[3:0] LED1;
output wire	[3:0] LED2;

wire	SYNTHESIZED_WIRE_0;
wire	[3:0] SYNTHESIZED_WIRE_1;





Decimal_to_binary	b2v_inst(
	.CLK(CLK),
	.RST(RST),
	.Keypad(Keypad),
	
	.chk(SYNTHESIZED_WIRE_0),
	
	.bin(SYNTHESIZED_WIRE_1));


DoubleFourBitsRegister	b2v_inst1(
	.Ce(SYNTHESIZED_WIRE_0),
	.CLK(CLK),
	.RST(RST),
	.Din(SYNTHESIZED_WIRE_1),
	.Aout(LED1),
	.Bout(LED2));


endmodule
