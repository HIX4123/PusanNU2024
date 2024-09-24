-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "09/23/2024 19:22:17"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	FourBitsRegister IS
    PORT (
	Dout0 : OUT std_logic;
	RST : IN std_logic;
	CLK : IN std_logic;
	d0 : IN std_logic;
	Ce : IN std_logic;
	Dout1 : OUT std_logic;
	d1 : IN std_logic;
	Dout2 : OUT std_logic;
	d2 : IN std_logic;
	Dout3 : OUT std_logic;
	d3 : IN std_logic
	);
END FourBitsRegister;

-- Design Ports Information
-- Dout0	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout1	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout2	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout3	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Ce	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RST	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d0	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d1	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d2	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d3	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF FourBitsRegister IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Dout0 : std_logic;
SIGNAL ww_RST : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_d0 : std_logic;
SIGNAL ww_Ce : std_logic;
SIGNAL ww_Dout1 : std_logic;
SIGNAL ww_d1 : std_logic;
SIGNAL ww_Dout2 : std_logic;
SIGNAL ww_d2 : std_logic;
SIGNAL ww_Dout3 : std_logic;
SIGNAL ww_d3 : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \RST~input_o\ : std_logic;
SIGNAL \Ce~input_o\ : std_logic;
SIGNAL \inst~1_combout\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CLK~inputCLKENA0_outclk\ : std_logic;
SIGNAL \d0~input_o\ : std_logic;
SIGNAL \inst~3_combout\ : std_logic;
SIGNAL \inst~0_combout\ : std_logic;
SIGNAL \inst~_emulated_q\ : std_logic;
SIGNAL \inst~2_combout\ : std_logic;
SIGNAL \d1~input_o\ : std_logic;
SIGNAL \inst2~1_combout\ : std_logic;
SIGNAL \inst2~_emulated_q\ : std_logic;
SIGNAL \inst2~0_combout\ : std_logic;
SIGNAL \d2~input_o\ : std_logic;
SIGNAL \inst3~1_combout\ : std_logic;
SIGNAL \inst3~_emulated_q\ : std_logic;
SIGNAL \inst3~0_combout\ : std_logic;
SIGNAL \d3~input_o\ : std_logic;
SIGNAL \inst4~1_combout\ : std_logic;
SIGNAL \inst4~_emulated_q\ : std_logic;
SIGNAL \inst4~0_combout\ : std_logic;
SIGNAL \ALT_INV_d3~input_o\ : std_logic;
SIGNAL \ALT_INV_d2~input_o\ : std_logic;
SIGNAL \ALT_INV_d1~input_o\ : std_logic;
SIGNAL \ALT_INV_d0~input_o\ : std_logic;
SIGNAL \ALT_INV_RST~input_o\ : std_logic;
SIGNAL \ALT_INV_Ce~input_o\ : std_logic;
SIGNAL \ALT_INV_inst~1_combout\ : std_logic;
SIGNAL \ALT_INV_inst~0_combout\ : std_logic;
SIGNAL \ALT_INV_inst4~_emulated_q\ : std_logic;
SIGNAL \ALT_INV_inst3~_emulated_q\ : std_logic;
SIGNAL \ALT_INV_inst2~_emulated_q\ : std_logic;
SIGNAL \ALT_INV_inst~_emulated_q\ : std_logic;

BEGIN

Dout0 <= ww_Dout0;
ww_RST <= RST;
ww_CLK <= CLK;
ww_d0 <= d0;
ww_Ce <= Ce;
Dout1 <= ww_Dout1;
ww_d1 <= d1;
Dout2 <= ww_Dout2;
ww_d2 <= d2;
Dout3 <= ww_Dout3;
ww_d3 <= d3;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_d3~input_o\ <= NOT \d3~input_o\;
\ALT_INV_d2~input_o\ <= NOT \d2~input_o\;
\ALT_INV_d1~input_o\ <= NOT \d1~input_o\;
\ALT_INV_d0~input_o\ <= NOT \d0~input_o\;
\ALT_INV_RST~input_o\ <= NOT \RST~input_o\;
\ALT_INV_Ce~input_o\ <= NOT \Ce~input_o\;
\ALT_INV_inst~1_combout\ <= NOT \inst~1_combout\;
\ALT_INV_inst~0_combout\ <= NOT \inst~0_combout\;
\ALT_INV_inst4~_emulated_q\ <= NOT \inst4~_emulated_q\;
\ALT_INV_inst3~_emulated_q\ <= NOT \inst3~_emulated_q\;
\ALT_INV_inst2~_emulated_q\ <= NOT \inst2~_emulated_q\;
\ALT_INV_inst~_emulated_q\ <= NOT \inst~_emulated_q\;

-- Location: IOOBUF_X89_Y36_N5
\Dout0~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst~2_combout\,
	devoe => ww_devoe,
	o => ww_Dout0);

-- Location: IOOBUF_X89_Y36_N56
\Dout1~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2~0_combout\,
	devoe => ww_devoe,
	o => ww_Dout1);

-- Location: IOOBUF_X89_Y38_N56
\Dout2~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3~0_combout\,
	devoe => ww_devoe,
	o => ww_Dout2);

-- Location: IOOBUF_X89_Y38_N22
\Dout3~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4~0_combout\,
	devoe => ww_devoe,
	o => ww_Dout3);

-- Location: IOIBUF_X89_Y37_N38
\RST~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RST,
	o => \RST~input_o\);

-- Location: IOIBUF_X89_Y37_N4
\Ce~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Ce,
	o => \Ce~input_o\);

-- Location: LABCELL_X88_Y37_N33
\inst~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst~1_combout\ = ( \Ce~input_o\ & ( \inst~1_combout\ & ( \RST~input_o\ ) ) ) # ( !\Ce~input_o\ & ( \inst~1_combout\ & ( \RST~input_o\ ) ) ) # ( !\Ce~input_o\ & ( !\inst~1_combout\ & ( \RST~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_RST~input_o\,
	datae => \ALT_INV_Ce~input_o\,
	dataf => \ALT_INV_inst~1_combout\,
	combout => \inst~1_combout\);

-- Location: IOIBUF_X89_Y35_N61
\CLK~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: CLKCTRL_G10
\CLK~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~input_o\,
	outclk => \CLK~inputCLKENA0_outclk\);

-- Location: IOIBUF_X89_Y37_N55
\d0~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d0,
	o => \d0~input_o\);

-- Location: LABCELL_X88_Y37_N0
\inst~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst~3_combout\ = !\inst~1_combout\ $ (!\d0~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001011010010110100101101001011010010110100101101001011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_inst~1_combout\,
	datac => \ALT_INV_d0~input_o\,
	combout => \inst~3_combout\);

-- Location: LABCELL_X88_Y37_N57
\inst~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst~0_combout\ = ( !\Ce~input_o\ & ( \RST~input_o\ ) ) # ( \Ce~input_o\ & ( !\RST~input_o\ ) ) # ( !\Ce~input_o\ & ( !\RST~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_Ce~input_o\,
	dataf => \ALT_INV_RST~input_o\,
	combout => \inst~0_combout\);

-- Location: FF_X88_Y37_N1
\inst~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst~3_combout\,
	clrn => \ALT_INV_inst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst~_emulated_q\);

-- Location: LABCELL_X88_Y37_N3
\inst~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst~2_combout\ = ( \RST~input_o\ & ( (!\Ce~input_o\) # (!\inst~1_combout\ $ (!\inst~_emulated_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111010110101111111101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_inst~1_combout\,
	datac => \ALT_INV_inst~_emulated_q\,
	datad => \ALT_INV_Ce~input_o\,
	dataf => \ALT_INV_RST~input_o\,
	combout => \inst~2_combout\);

-- Location: IOIBUF_X89_Y35_N44
\d1~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d1,
	o => \d1~input_o\);

-- Location: LABCELL_X88_Y37_N6
\inst2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2~1_combout\ = ( \d1~input_o\ & ( !\inst~1_combout\ ) ) # ( !\d1~input_o\ & ( \inst~1_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_inst~1_combout\,
	dataf => \ALT_INV_d1~input_o\,
	combout => \inst2~1_combout\);

-- Location: FF_X88_Y37_N8
\inst2~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst2~1_combout\,
	clrn => \ALT_INV_inst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2~_emulated_q\);

-- Location: LABCELL_X88_Y37_N9
\inst2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2~0_combout\ = ( \RST~input_o\ & ( (!\Ce~input_o\) # (!\inst~1_combout\ $ (!\inst2~_emulated_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111010110101111111101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_inst~1_combout\,
	datac => \ALT_INV_inst2~_emulated_q\,
	datad => \ALT_INV_Ce~input_o\,
	dataf => \ALT_INV_RST~input_o\,
	combout => \inst2~0_combout\);

-- Location: IOIBUF_X89_Y37_N21
\d2~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d2,
	o => \d2~input_o\);

-- Location: LABCELL_X88_Y37_N12
\inst3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3~1_combout\ = ( \d2~input_o\ & ( !\inst~1_combout\ ) ) # ( !\d2~input_o\ & ( \inst~1_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_inst~1_combout\,
	dataf => \ALT_INV_d2~input_o\,
	combout => \inst3~1_combout\);

-- Location: FF_X88_Y37_N14
\inst3~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst3~1_combout\,
	clrn => \ALT_INV_inst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3~_emulated_q\);

-- Location: LABCELL_X88_Y37_N15
\inst3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3~0_combout\ = ( \RST~input_o\ & ( (!\Ce~input_o\) # (!\inst~1_combout\ $ (!\inst3~_emulated_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111010110101111111101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_inst~1_combout\,
	datac => \ALT_INV_inst3~_emulated_q\,
	datad => \ALT_INV_Ce~input_o\,
	dataf => \ALT_INV_RST~input_o\,
	combout => \inst3~0_combout\);

-- Location: IOIBUF_X89_Y35_N95
\d3~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d3,
	o => \d3~input_o\);

-- Location: LABCELL_X88_Y37_N51
\inst4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst4~1_combout\ = !\inst~1_combout\ $ (!\d3~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010110101010010101011010101001010101101010100101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_inst~1_combout\,
	datad => \ALT_INV_d3~input_o\,
	combout => \inst4~1_combout\);

-- Location: FF_X88_Y37_N53
\inst4~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst4~1_combout\,
	clrn => \ALT_INV_inst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4~_emulated_q\);

-- Location: LABCELL_X88_Y37_N48
\inst4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst4~0_combout\ = ( \RST~input_o\ & ( (!\Ce~input_o\) # (!\inst~1_combout\ $ (!\inst4~_emulated_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111010110101111111101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_inst~1_combout\,
	datac => \ALT_INV_inst4~_emulated_q\,
	datad => \ALT_INV_Ce~input_o\,
	dataf => \ALT_INV_RST~input_o\,
	combout => \inst4~0_combout\);

-- Location: LABCELL_X13_Y49_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


