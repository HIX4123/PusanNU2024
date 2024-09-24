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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "09/23/2024 19:22:16"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          FourBitsRegister
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY FourBitsRegister_vhd_vec_tst IS
END FourBitsRegister_vhd_vec_tst;
ARCHITECTURE FourBitsRegister_arch OF FourBitsRegister_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Ce : STD_LOGIC;
SIGNAL CLK : STD_LOGIC;
SIGNAL d0 : STD_LOGIC;
SIGNAL d1 : STD_LOGIC;
SIGNAL d2 : STD_LOGIC;
SIGNAL d3 : STD_LOGIC;
SIGNAL Dout0 : STD_LOGIC;
SIGNAL Dout1 : STD_LOGIC;
SIGNAL Dout2 : STD_LOGIC;
SIGNAL Dout3 : STD_LOGIC;
SIGNAL RST : STD_LOGIC;
COMPONENT FourBitsRegister
	PORT (
	Ce : IN STD_LOGIC;
	CLK : IN STD_LOGIC;
	d0 : IN STD_LOGIC;
	d1 : IN STD_LOGIC;
	d2 : IN STD_LOGIC;
	d3 : IN STD_LOGIC;
	Dout0 : OUT STD_LOGIC;
	Dout1 : OUT STD_LOGIC;
	Dout2 : OUT STD_LOGIC;
	Dout3 : OUT STD_LOGIC;
	RST : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : FourBitsRegister
	PORT MAP (
-- list connections between master ports and signals
	Ce => Ce,
	CLK => CLK,
	d0 => d0,
	d1 => d1,
	d2 => d2,
	d3 => d3,
	Dout0 => Dout0,
	Dout1 => Dout1,
	Dout2 => Dout2,
	Dout3 => Dout3,
	RST => RST
	);

-- RST
t_prcs_RST: PROCESS
BEGIN
	RST <= '1';
WAIT;
END PROCESS t_prcs_RST;

-- Ce
t_prcs_Ce: PROCESS
BEGIN
	Ce <= '0';
	WAIT FOR 40000 ps;
	Ce <= '1';
	WAIT FOR 40000 ps;
	Ce <= '0';
	WAIT FOR 40000 ps;
	Ce <= '1';
	WAIT FOR 40000 ps;
	Ce <= '0';
WAIT;
END PROCESS t_prcs_Ce;

-- CLK
t_prcs_CLK: PROCESS
BEGIN
LOOP
	CLK <= '0';
	WAIT FOR 2500 ps;
	CLK <= '1';
	WAIT FOR 2500 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLK;

-- d0
t_prcs_d0: PROCESS
BEGIN
	d0 <= '0';
	WAIT FOR 40000 ps;
	d0 <= '1';
	WAIT FOR 40000 ps;
	d0 <= '0';
WAIT;
END PROCESS t_prcs_d0;

-- d1
t_prcs_d1: PROCESS
BEGIN
	d1 <= '0';
	WAIT FOR 120000 ps;
	d1 <= '1';
	WAIT FOR 40000 ps;
	d1 <= '0';
WAIT;
END PROCESS t_prcs_d1;

-- d2
t_prcs_d2: PROCESS
BEGIN
	d2 <= '0';
	WAIT FOR 40000 ps;
	d2 <= '1';
	WAIT FOR 40000 ps;
	d2 <= '0';
WAIT;
END PROCESS t_prcs_d2;

-- d3
t_prcs_d3: PROCESS
BEGIN
	d3 <= '0';
	WAIT FOR 120000 ps;
	d3 <= '1';
	WAIT FOR 40000 ps;
	d3 <= '0';
WAIT;
END PROCESS t_prcs_d3;
END FourBitsRegister_arch;
