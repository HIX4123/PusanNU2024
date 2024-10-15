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
// CREATED		"Mon Oct 14 19:17:51 2024"

module Decimal_to_binary(
	Keypad,
	chk,
	star,
	sharp,
	bin
);


input wire	[11:0] Keypad;
output wire	chk;
output wire	star;
output wire	sharp;
output wire	[3:0] bin;

wire	[3:0] Bin_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;

assign	star = Keypad[10];
assign	sharp = Keypad[11];



assign	SYNTHESIZED_WIRE_7 = Keypad[4] | Keypad[6] | Keypad[7] | Keypad[5];

assign	SYNTHESIZED_WIRE_5 = Keypad[2] | Keypad[6] | Keypad[7] | Keypad[3];

assign	SYNTHESIZED_WIRE_1 = Keypad[0] | Keypad[2] | Keypad[1] | Keypad[3] | Keypad[5] | Keypad[4] | Keypad[6] | Keypad[7];

assign	SYNTHESIZED_WIRE_10 = Keypad[1] | Keypad[5] | Keypad[7] | Keypad[3];

assign	chk = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_0 = Keypad[9] | Keypad[8];

assign	SYNTHESIZED_WIRE_9 = Keypad[9] | Keypad[8];

assign	SYNTHESIZED_WIRE_11 =  ~Keypad[0];

assign	Bin_ALTERA_SYNTHESIZED[0] = SYNTHESIZED_WIRE_11 & SYNTHESIZED_WIRE_3;

assign	Bin_ALTERA_SYNTHESIZED[1] = SYNTHESIZED_WIRE_11 & SYNTHESIZED_WIRE_5;

assign	Bin_ALTERA_SYNTHESIZED[2] = SYNTHESIZED_WIRE_11 & SYNTHESIZED_WIRE_7;

assign	Bin_ALTERA_SYNTHESIZED[3] = SYNTHESIZED_WIRE_11 & SYNTHESIZED_WIRE_9;

assign	SYNTHESIZED_WIRE_3 = Keypad[9] | SYNTHESIZED_WIRE_10;

assign	bin = Bin_ALTERA_SYNTHESIZED;

endmodule
