-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 18.0.0 Build 614 04/24/2018 SJ Standard Edition"
-- CREATED		"Tue Oct 02 22:57:49 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Lab5a IS 
	PORT
	(
		C_in :  IN  STD_LOGIC;
		Xin8b :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		Yin8b :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		C_Out :  OUT  STD_LOGIC;
		o_Sum :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END Lab5a;

ARCHITECTURE bdf_type OF Lab5a IS 

COMPONENT full_adder
	PORT(i_A : IN STD_LOGIC;
		 i_B : IN STD_LOGIC;
		 i_Carry_in : IN STD_LOGIC;
		 o_Sum : OUT STD_LOGIC;
		 o_Carry_out : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	o_Sum_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;


BEGIN 



b2v_inst : full_adder
PORT MAP(i_A => Xin8b(3),
		 i_B => Yin8b(3),
		 i_Carry_in => SYNTHESIZED_WIRE_0,
		 o_Sum => o_Sum_ALTERA_SYNTHESIZED(3),
		 o_Carry_out => SYNTHESIZED_WIRE_6);


b2v_inst2 : full_adder
PORT MAP(i_A => Xin8b(2),
		 i_B => Yin8b(2),
		 i_Carry_in => SYNTHESIZED_WIRE_1,
		 o_Sum => o_Sum_ALTERA_SYNTHESIZED(2),
		 o_Carry_out => SYNTHESIZED_WIRE_0);


b2v_inst3 : full_adder
PORT MAP(i_A => Xin8b(1),
		 i_B => Yin8b(1),
		 i_Carry_in => SYNTHESIZED_WIRE_2,
		 o_Sum => o_Sum_ALTERA_SYNTHESIZED(1),
		 o_Carry_out => SYNTHESIZED_WIRE_1);


b2v_inst4 : full_adder
PORT MAP(i_A => Xin8b(0),
		 i_B => Yin8b(0),
		 i_Carry_in => C_in,
		 o_Sum => o_Sum_ALTERA_SYNTHESIZED(0),
		 o_Carry_out => SYNTHESIZED_WIRE_2);


b2v_inst5 : full_adder
PORT MAP(i_A => Xin8b(7),
		 i_B => Yin8b(7),
		 i_Carry_in => SYNTHESIZED_WIRE_3,
		 o_Sum => o_Sum_ALTERA_SYNTHESIZED(7),
		 o_Carry_out => C_Out);


b2v_inst6 : full_adder
PORT MAP(i_A => Xin8b(6),
		 i_B => Yin8b(6),
		 i_Carry_in => SYNTHESIZED_WIRE_4,
		 o_Sum => o_Sum_ALTERA_SYNTHESIZED(6),
		 o_Carry_out => SYNTHESIZED_WIRE_3);


b2v_inst7 : full_adder
PORT MAP(i_A => Xin8b(5),
		 i_B => Yin8b(5),
		 i_Carry_in => SYNTHESIZED_WIRE_5,
		 o_Sum => o_Sum_ALTERA_SYNTHESIZED(5),
		 o_Carry_out => SYNTHESIZED_WIRE_4);


b2v_inst8 : full_adder
PORT MAP(i_A => Xin8b(4),
		 i_B => Yin8b(4),
		 i_Carry_in => SYNTHESIZED_WIRE_6,
		 o_Sum => o_Sum_ALTERA_SYNTHESIZED(4),
		 o_Carry_out => SYNTHESIZED_WIRE_5);

o_Sum <= o_Sum_ALTERA_SYNTHESIZED;

END bdf_type;