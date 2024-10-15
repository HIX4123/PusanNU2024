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
// CREATED		"Mon Oct 14 21:50:31 2024"

module Decimal_to_binary(
	CLK,
	RST,
	Keypad,
	chk,
	star,
	sharp,
	bin
);


input wire	CLK;
input wire	RST;
input wire	[11:0] Keypad;
output wire	chk;
output wire	star;
output wire	sharp;
output wire	[3:0] bin;

wire	[3:0] Bin_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_36;

assign	star = Keypad[10];
assign	sharp = Keypad[11];




Trigger	b2v_inst(
	.Din(Keypad[0]),
	.CLK(CLK),
	.RST(RST),
	.Dout(SYNTHESIZED_WIRE_43));

assign	SYNTHESIZED_WIRE_32 = SYNTHESIZED_WIRE_37 | SYNTHESIZED_WIRE_38 | SYNTHESIZED_WIRE_39 | SYNTHESIZED_WIRE_40;

assign	SYNTHESIZED_WIRE_30 = SYNTHESIZED_WIRE_41 | SYNTHESIZED_WIRE_38 | SYNTHESIZED_WIRE_39 | SYNTHESIZED_WIRE_42;


Trigger	b2v_inst11(
	.Din(Keypad[3]),
	.CLK(CLK),
	.RST(RST),
	.Dout(SYNTHESIZED_WIRE_42));

assign	SYNTHESIZED_WIRE_21 = SYNTHESIZED_WIRE_43 | SYNTHESIZED_WIRE_41 | SYNTHESIZED_WIRE_44 | SYNTHESIZED_WIRE_42 | SYNTHESIZED_WIRE_40 | SYNTHESIZED_WIRE_37 | SYNTHESIZED_WIRE_38 | SYNTHESIZED_WIRE_39;

assign	SYNTHESIZED_WIRE_36 = SYNTHESIZED_WIRE_44 | SYNTHESIZED_WIRE_40 | SYNTHESIZED_WIRE_39 | SYNTHESIZED_WIRE_42;

assign	chk = SYNTHESIZED_WIRE_20 | SYNTHESIZED_WIRE_21;

assign	SYNTHESIZED_WIRE_20 = SYNTHESIZED_WIRE_45 | SYNTHESIZED_WIRE_46;


Trigger	b2v_inst14(
	.Din(Keypad[4]),
	.CLK(CLK),
	.RST(RST),
	.Dout(SYNTHESIZED_WIRE_37));


Trigger	b2v_inst15(
	.Din(Keypad[5]),
	.CLK(CLK),
	.RST(RST),
	.Dout(SYNTHESIZED_WIRE_40));


Trigger	b2v_inst17(
	.Din(Keypad[6]),
	.CLK(CLK),
	.RST(RST),
	.Dout(SYNTHESIZED_WIRE_38));


Trigger	b2v_inst18(
	.Din(Keypad[7]),
	.CLK(CLK),
	.RST(RST),
	.Dout(SYNTHESIZED_WIRE_39));


Trigger	b2v_inst19(
	.Din(Keypad[8]),
	.CLK(CLK),
	.RST(RST),
	.Dout(SYNTHESIZED_WIRE_46));


Trigger	b2v_inst2(
	.Din(Keypad[1]),
	.CLK(CLK),
	.RST(RST),
	.Dout(SYNTHESIZED_WIRE_44));


Trigger	b2v_inst20(
	.Din(Keypad[9]),
	.CLK(CLK),
	.RST(RST),
	.Dout(SYNTHESIZED_WIRE_45));

assign	SYNTHESIZED_WIRE_34 = SYNTHESIZED_WIRE_45 | SYNTHESIZED_WIRE_46;

assign	SYNTHESIZED_WIRE_47 =  ~SYNTHESIZED_WIRE_43;

assign	Bin_ALTERA_SYNTHESIZED[0] = SYNTHESIZED_WIRE_47 & SYNTHESIZED_WIRE_28;

assign	Bin_ALTERA_SYNTHESIZED[1] = SYNTHESIZED_WIRE_47 & SYNTHESIZED_WIRE_30;

assign	Bin_ALTERA_SYNTHESIZED[2] = SYNTHESIZED_WIRE_47 & SYNTHESIZED_WIRE_32;

assign	Bin_ALTERA_SYNTHESIZED[3] = SYNTHESIZED_WIRE_47 & SYNTHESIZED_WIRE_34;


Trigger	b2v_inst8(
	.Din(Keypad[2]),
	.CLK(CLK),
	.RST(RST),
	.Dout(SYNTHESIZED_WIRE_41));

assign	SYNTHESIZED_WIRE_28 = SYNTHESIZED_WIRE_45 | SYNTHESIZED_WIRE_36;

assign	bin = Bin_ALTERA_SYNTHESIZED;

endmodule
