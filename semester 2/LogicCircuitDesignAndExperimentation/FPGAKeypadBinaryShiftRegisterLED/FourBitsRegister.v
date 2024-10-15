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
// CREATED		"Mon Oct 14 21:51:54 2024"

module FourBitsRegister(
	Ce,
	CLK,
	RST,
	bin,
	bout
);


input wire	Ce;
input wire	CLK;
input wire	RST;
input wire	[3:0] bin;
output wire	[3:0] bout;

reg	[3:0] bout_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_4;




assign	SYNTHESIZED_WIRE_4 = Ce & CLK;


always@(posedge SYNTHESIZED_WIRE_4 or negedge RST)
begin
if (!RST)
	begin
	bout_ALTERA_SYNTHESIZED[0] <= 0;
	end
else
	begin
	bout_ALTERA_SYNTHESIZED[0] <= bin[0];
	end
end


always@(posedge SYNTHESIZED_WIRE_4 or negedge RST)
begin
if (!RST)
	begin
	bout_ALTERA_SYNTHESIZED[1] <= 0;
	end
else
	begin
	bout_ALTERA_SYNTHESIZED[1] <= bin[1];
	end
end


always@(posedge SYNTHESIZED_WIRE_4 or negedge RST)
begin
if (!RST)
	begin
	bout_ALTERA_SYNTHESIZED[2] <= 0;
	end
else
	begin
	bout_ALTERA_SYNTHESIZED[2] <= bin[2];
	end
end


always@(posedge SYNTHESIZED_WIRE_4 or negedge RST)
begin
if (!RST)
	begin
	bout_ALTERA_SYNTHESIZED[3] <= 0;
	end
else
	begin
	bout_ALTERA_SYNTHESIZED[3] <= bin[3];
	end
end

assign	bout = bout_ALTERA_SYNTHESIZED;

endmodule
