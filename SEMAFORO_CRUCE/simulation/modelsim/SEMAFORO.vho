-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "05/08/2020 17:32:55"

-- 
-- Device: Altera 5M40ZM64A5 Package MBGA64
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXV;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXV.MAXV_COMPONENTS.ALL;

ENTITY 	SEMAFORO IS
    PORT (
	sensor : IN std_logic;
	clk_1s : IN std_logic;
	reset : IN std_logic;
	rural : OUT std_logic_vector(2 DOWNTO 0);
	carretera : OUT std_logic_vector(2 DOWNTO 0)
	);
END SEMAFORO;

-- Design Ports Information
-- sensor	=>  Location: PIN_A1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clk_1s	=>  Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset	=>  Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- rural[0]	=>  Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- rural[1]	=>  Location: PIN_A3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- rural[2]	=>  Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- carretera[0]	=>  Location: PIN_C5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- carretera[1]	=>  Location: PIN_A4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- carretera[2]	=>  Location: PIN_C6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA


ARCHITECTURE structure OF SEMAFORO IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_sensor : std_logic;
SIGNAL ww_clk_1s : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_rural : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_carretera : std_logic_vector(2 DOWNTO 0);
SIGNAL \clk_1s~combout\ : std_logic;
SIGNAL \cuenta_tiempo:cuenta[4]~regout\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \cuenta_tiempo:cuenta[0]~regout\ : std_logic;
SIGNAL \Add0~12\ : std_logic;
SIGNAL \Add0~12COUT1_31\ : std_logic;
SIGNAL \Add0~5_combout\ : std_logic;
SIGNAL \cuenta_tiempo:cuenta[1]~regout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~7COUT1_33\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~22COUT1_35\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \cuenta_tiempo:cuenta[3]~regout\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~2COUT1_37\ : std_logic;
SIGNAL \Add0~15_combout\ : std_logic;
SIGNAL \fin_largo~8_combout\ : std_logic;
SIGNAL \fin_corto~regout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \estado_presente.camiamarillo~regout\ : std_logic;
SIGNAL \Selector12~0_combout\ : std_logic;
SIGNAL \sensor~combout\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \reset_cuenta~combout\ : std_logic;
SIGNAL \cuenta_tiempo:cuenta[2]~regout\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \fin_largo~regout\ : std_logic;
SIGNAL \estado_presente.espera~regout\ : std_logic;
SIGNAL \estado_presente.inicial~regout\ : std_logic;
SIGNAL \estado_presente.carramarillo~regout\ : std_logic;
SIGNAL \estado_presente.camiverde~regout\ : std_logic;
SIGNAL \rural[0]$latch~combout\ : std_logic;
SIGNAL \rural~0_combout\ : std_logic;
SIGNAL \rural[1]$latch~combout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \rural[2]$latch~combout\ : std_logic;
SIGNAL \carretera[0]$latch~combout\ : std_logic;
SIGNAL \Selector9~0_combout\ : std_logic;
SIGNAL \carretera[1]$latch~combout\ : std_logic;
SIGNAL \Selector10~0_combout\ : std_logic;
SIGNAL \carretera[2]$latch~combout\ : std_logic;

BEGIN

ww_sensor <= sensor;
ww_clk_1s <= clk_1s;
ww_reset <= reset;
rural <= ww_rural;
carretera <= ww_carretera;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk_1s~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_clk_1s,
	combout => \clk_1s~combout\);

-- Location: LC_X7_Y4_N3
\cuenta_tiempo:cuenta[4]\ : maxv_lcell
-- Equation(s):
-- \cuenta_tiempo:cuenta[4]~regout\ = DFFEAS((((!\reset_cuenta~combout\ & \Add0~15_combout\))), GLOBAL(\clk_1s~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk_1s~combout\,
	datac => \reset_cuenta~combout\,
	datad => \Add0~15_combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \cuenta_tiempo:cuenta[4]~regout\);

-- Location: LC_X7_Y4_N5
\Add0~10\ : maxv_lcell
-- Equation(s):
-- \Add0~10_combout\ = ((!\cuenta_tiempo:cuenta[0]~regout\))
-- \Add0~12\ = CARRY(((\cuenta_tiempo:cuenta[0]~regout\)))
-- \Add0~12COUT1_31\ = CARRY(((\cuenta_tiempo:cuenta[0]~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \cuenta_tiempo:cuenta[0]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~10_combout\,
	cout0 => \Add0~12\,
	cout1 => \Add0~12COUT1_31\);

-- Location: LC_X7_Y4_N2
\cuenta_tiempo:cuenta[0]\ : maxv_lcell
-- Equation(s):
-- \cuenta_tiempo:cuenta[0]~regout\ = DFFEAS((\Add0~10_combout\ & (((!\reset_cuenta~combout\)))), GLOBAL(\clk_1s~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0a0a",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk_1s~combout\,
	dataa => \Add0~10_combout\,
	datac => \reset_cuenta~combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \cuenta_tiempo:cuenta[0]~regout\);

-- Location: LC_X7_Y4_N6
\Add0~5\ : maxv_lcell
-- Equation(s):
-- \Add0~5_combout\ = (\cuenta_tiempo:cuenta[1]~regout\ $ ((\Add0~12\)))
-- \Add0~7\ = CARRY(((!\Add0~12\) # (!\cuenta_tiempo:cuenta[1]~regout\)))
-- \Add0~7COUT1_33\ = CARRY(((!\Add0~12COUT1_31\) # (!\cuenta_tiempo:cuenta[1]~regout\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \cuenta_tiempo:cuenta[1]~regout\,
	cin0 => \Add0~12\,
	cin1 => \Add0~12COUT1_31\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~5_combout\,
	cout0 => \Add0~7\,
	cout1 => \Add0~7COUT1_33\);

-- Location: LC_X7_Y4_N1
\cuenta_tiempo:cuenta[1]\ : maxv_lcell
-- Equation(s):
-- \cuenta_tiempo:cuenta[1]~regout\ = DFFEAS((\Add0~5_combout\ & (((!\reset_cuenta~combout\)))), GLOBAL(\clk_1s~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0a0a",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk_1s~combout\,
	dataa => \Add0~5_combout\,
	datac => \reset_cuenta~combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \cuenta_tiempo:cuenta[1]~regout\);

-- Location: LC_X7_Y4_N7
\Add0~20\ : maxv_lcell
-- Equation(s):
-- \Add0~20_combout\ = (\cuenta_tiempo:cuenta[2]~regout\ $ ((!\Add0~7\)))
-- \Add0~22\ = CARRY(((\cuenta_tiempo:cuenta[2]~regout\ & !\Add0~7\)))
-- \Add0~22COUT1_35\ = CARRY(((\cuenta_tiempo:cuenta[2]~regout\ & !\Add0~7COUT1_33\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \cuenta_tiempo:cuenta[2]~regout\,
	cin0 => \Add0~7\,
	cin1 => \Add0~7COUT1_33\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~20_combout\,
	cout0 => \Add0~22\,
	cout1 => \Add0~22COUT1_35\);

-- Location: LC_X7_Y4_N8
\Add0~0\ : maxv_lcell
-- Equation(s):
-- \Add0~0_combout\ = \cuenta_tiempo:cuenta[3]~regout\ $ ((((\Add0~22\))))
-- \Add0~2\ = CARRY(((!\Add0~22\)) # (!\cuenta_tiempo:cuenta[3]~regout\))
-- \Add0~2COUT1_37\ = CARRY(((!\Add0~22COUT1_35\)) # (!\cuenta_tiempo:cuenta[3]~regout\))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \cuenta_tiempo:cuenta[3]~regout\,
	cin0 => \Add0~22\,
	cin1 => \Add0~22COUT1_35\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~0_combout\,
	cout0 => \Add0~2\,
	cout1 => \Add0~2COUT1_37\);

-- Location: LC_X7_Y4_N4
\cuenta_tiempo:cuenta[3]\ : maxv_lcell
-- Equation(s):
-- \cuenta_tiempo:cuenta[3]~regout\ = DFFEAS((((!\reset_cuenta~combout\ & \Add0~0_combout\))), GLOBAL(\clk_1s~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk_1s~combout\,
	datac => \reset_cuenta~combout\,
	datad => \Add0~0_combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \cuenta_tiempo:cuenta[3]~regout\);

-- Location: LC_X7_Y4_N9
\Add0~15\ : maxv_lcell
-- Equation(s):
-- \Add0~15_combout\ = ((\Add0~2\ $ (!\cuenta_tiempo:cuenta[4]~regout\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "f00f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datad => \cuenta_tiempo:cuenta[4]~regout\,
	cin0 => \Add0~2\,
	cin1 => \Add0~2COUT1_37\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~15_combout\);

-- Location: LC_X6_Y4_N2
\fin_largo~8\ : maxv_lcell
-- Equation(s):
-- \fin_largo~8_combout\ = (!\reset_cuenta~combout\ & (!\Add0~10_combout\ & (\Add0~5_combout\ & \Add0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \reset_cuenta~combout\,
	datab => \Add0~10_combout\,
	datac => \Add0~5_combout\,
	datad => \Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \fin_largo~8_combout\);

-- Location: LC_X6_Y4_N3
fin_corto : maxv_lcell
-- Equation(s):
-- \fin_corto~regout\ = DFFEAS((\fin_largo~8_combout\ & ((\reset_cuenta~combout\) # ((!\Add0~20_combout\ & !\Add0~15_combout\)))), GLOBAL(\clk_1s~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cd00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk_1s~combout\,
	dataa => \Add0~20_combout\,
	datab => \reset_cuenta~combout\,
	datac => \Add0~15_combout\,
	datad => \fin_largo~8_combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fin_corto~regout\);

-- Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reset,
	combout => \reset~combout\);

-- Location: LC_X6_Y4_N9
\estado_presente.camiamarillo\ : maxv_lcell
-- Equation(s):
-- \estado_presente.camiamarillo~regout\ = DFFEAS((((\estado_presente.camiverde~regout\ & \fin_corto~regout\))), GLOBAL(\clk_1s~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk_1s~combout\,
	datac => \estado_presente.camiverde~regout\,
	datad => \fin_corto~regout\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado_presente.camiamarillo~regout\);

-- Location: LC_X6_Y4_N5
\Selector12~0\ : maxv_lcell
-- Equation(s):
-- \Selector12~0_combout\ = ((\estado_presente.camiamarillo~regout\) # ((\estado_presente.carramarillo~regout\) # (!\estado_presente.inicial~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fcff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \estado_presente.camiamarillo~regout\,
	datac => \estado_presente.carramarillo~regout\,
	datad => \estado_presente.inicial~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Selector12~0_combout\);

-- Location: PIN_A1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sensor~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_sensor,
	combout => \sensor~combout\);

-- Location: LC_X2_Y3_N3
\Selector8~0\ : maxv_lcell
-- Equation(s):
-- \Selector8~0_combout\ = (\sensor~combout\ & (\estado_presente.inicial~regout\ & ((!\fin_corto~regout\) # (!\estado_presente.camiverde~regout\)))) # (!\sensor~combout\ & (((!\fin_corto~regout\)) # (!\estado_presente.camiverde~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "31f5",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sensor~combout\,
	datab => \estado_presente.camiverde~regout\,
	datac => \estado_presente.inicial~regout\,
	datad => \fin_corto~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Selector8~0_combout\);

-- Location: LC_X2_Y3_N4
\Selector6~0\ : maxv_lcell
-- Equation(s):
-- \Selector6~0_combout\ = ((\Selector8~0_combout\ & ((!\fin_largo~regout\) # (!\estado_presente.espera~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7700",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \estado_presente.espera~regout\,
	datab => \fin_largo~regout\,
	datad => \Selector8~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Selector6~0_combout\);

-- Location: LC_X6_Y4_N8
reset_cuenta : maxv_lcell
-- Equation(s):
-- \reset_cuenta~combout\ = ((GLOBAL(\Selector6~0_combout\) & ((\Selector12~0_combout\))) # (!GLOBAL(\Selector6~0_combout\) & (\reset_cuenta~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0aa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \reset_cuenta~combout\,
	datac => \Selector12~0_combout\,
	datad => \Selector6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \reset_cuenta~combout\);

-- Location: LC_X7_Y4_N0
\cuenta_tiempo:cuenta[2]\ : maxv_lcell
-- Equation(s):
-- \cuenta_tiempo:cuenta[2]~regout\ = DFFEAS(((\Add0~20_combout\ & (!\reset_cuenta~combout\))), GLOBAL(\clk_1s~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0c0c",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk_1s~combout\,
	datab => \Add0~20_combout\,
	datac => \reset_cuenta~combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \cuenta_tiempo:cuenta[2]~regout\);

-- Location: LC_X6_Y4_N6
fin_largo : maxv_lcell
-- Equation(s):
-- \fin_largo~regout\ = DFFEAS((\Add0~20_combout\ & (!\reset_cuenta~combout\ & (\Add0~15_combout\ & \fin_largo~8_combout\))), GLOBAL(\clk_1s~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "2000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk_1s~combout\,
	dataa => \Add0~20_combout\,
	datab => \reset_cuenta~combout\,
	datac => \Add0~15_combout\,
	datad => \fin_largo~8_combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fin_largo~regout\);

-- Location: LC_X6_Y4_N4
\estado_presente.espera\ : maxv_lcell
-- Equation(s):
-- \estado_presente.espera~regout\ = DFFEAS(((\estado_presente.camiamarillo~regout\) # ((\estado_presente.espera~regout\ & !\fin_largo~regout\))), GLOBAL(\clk_1s~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff0c",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk_1s~combout\,
	datab => \estado_presente.espera~regout\,
	datac => \fin_largo~regout\,
	datad => \estado_presente.camiamarillo~regout\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado_presente.espera~regout\);

-- Location: LC_X5_Y4_N2
\estado_presente.inicial\ : maxv_lcell
-- Equation(s):
-- \estado_presente.inicial~regout\ = DFFEAS((\estado_presente.inicial~regout\ & (((!\fin_largo~regout\)) # (!\estado_presente.espera~regout\))) # (!\estado_presente.inicial~regout\ & (\sensor~combout\ & ((!\fin_largo~regout\) # 
-- (!\estado_presente.espera~regout\)))), GLOBAL(\clk_1s~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3f2a",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk_1s~combout\,
	dataa => \estado_presente.inicial~regout\,
	datab => \estado_presente.espera~regout\,
	datac => \fin_largo~regout\,
	datad => \sensor~combout\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado_presente.inicial~regout\);

-- Location: LC_X5_Y4_N1
\estado_presente.carramarillo\ : maxv_lcell
-- Equation(s):
-- \estado_presente.carramarillo~regout\ = DFFEAS(((!\estado_presente.inicial~regout\ & ((\sensor~combout\)))), GLOBAL(\clk_1s~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3300",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk_1s~combout\,
	datab => \estado_presente.inicial~regout\,
	datad => \sensor~combout\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado_presente.carramarillo~regout\);

-- Location: LC_X6_Y4_N7
\estado_presente.camiverde\ : maxv_lcell
-- Equation(s):
-- \estado_presente.camiverde~regout\ = DFFEAS((\estado_presente.carramarillo~regout\) # (((\estado_presente.camiverde~regout\ & !\fin_corto~regout\))), GLOBAL(\clk_1s~combout\), !GLOBAL(\reset~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aafa",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk_1s~combout\,
	dataa => \estado_presente.carramarillo~regout\,
	datac => \estado_presente.camiverde~regout\,
	datad => \fin_corto~regout\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado_presente.camiverde~regout\);

-- Location: LC_X2_Y4_N9
\rural[0]$latch\ : maxv_lcell
-- Equation(s):
-- \rural[0]$latch~combout\ = ((GLOBAL(\Selector6~0_combout\) & ((\estado_presente.camiverde~regout\))) # (!GLOBAL(\Selector6~0_combout\) & (\rural[0]$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \rural[0]$latch~combout\,
	datac => \estado_presente.camiverde~regout\,
	datad => \Selector6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \rural[0]$latch~combout\);

-- Location: LC_X5_Y4_N5
\rural~0\ : maxv_lcell
-- Equation(s):
-- \rural~0_combout\ = (((\estado_presente.camiamarillo~regout\) # (\estado_presente.carramarillo~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \estado_presente.camiamarillo~regout\,
	datad => \estado_presente.carramarillo~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \rural~0_combout\);

-- Location: LC_X5_Y4_N0
\rural[1]$latch\ : maxv_lcell
-- Equation(s):
-- \rural[1]$latch~combout\ = ((GLOBAL(\Selector6~0_combout\) & ((\rural~0_combout\))) # (!GLOBAL(\Selector6~0_combout\) & (\rural[1]$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \rural[1]$latch~combout\,
	datac => \rural~0_combout\,
	datad => \Selector6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \rural[1]$latch~combout\);

-- Location: LC_X5_Y4_N4
\Selector5~0\ : maxv_lcell
-- Equation(s):
-- \Selector5~0_combout\ = (((\estado_presente.espera~regout\)) # (!\estado_presente.inicial~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff33",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \estado_presente.inicial~regout\,
	datad => \estado_presente.espera~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Selector5~0_combout\);

-- Location: LC_X5_Y4_N9
\rural[2]$latch\ : maxv_lcell
-- Equation(s):
-- \rural[2]$latch~combout\ = ((GLOBAL(\Selector6~0_combout\) & ((\Selector5~0_combout\))) # (!GLOBAL(\Selector6~0_combout\) & (\rural[2]$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \rural[2]$latch~combout\,
	datac => \Selector5~0_combout\,
	datad => \Selector6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \rural[2]$latch~combout\);

-- Location: LC_X5_Y4_N3
\carretera[0]$latch\ : maxv_lcell
-- Equation(s):
-- \carretera[0]$latch~combout\ = (GLOBAL(\Selector8~0_combout\) & (!\estado_presente.inicial~regout\)) # (!GLOBAL(\Selector8~0_combout\) & (((\carretera[0]$latch~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7722",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Selector8~0_combout\,
	datab => \estado_presente.inicial~regout\,
	datad => \carretera[0]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \carretera[0]$latch~combout\);

-- Location: LC_X5_Y4_N6
\Selector9~0\ : maxv_lcell
-- Equation(s):
-- \Selector9~0_combout\ = ((\estado_presente.carramarillo~regout\) # ((\fin_largo~regout\ & \estado_presente.espera~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fccc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \estado_presente.carramarillo~regout\,
	datac => \fin_largo~regout\,
	datad => \estado_presente.espera~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Selector9~0_combout\);

-- Location: LC_X5_Y4_N7
\carretera[1]$latch\ : maxv_lcell
-- Equation(s):
-- \carretera[1]$latch~combout\ = (GLOBAL(\Selector8~0_combout\) & (((\Selector9~0_combout\)))) # (!GLOBAL(\Selector8~0_combout\) & (((\carretera[1]$latch~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fa50",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Selector8~0_combout\,
	datac => \carretera[1]$latch~combout\,
	datad => \Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \carretera[1]$latch~combout\);

-- Location: LC_X6_Y4_N0
\Selector10~0\ : maxv_lcell
-- Equation(s):
-- \Selector10~0_combout\ = (\estado_presente.camiverde~regout\) # ((\estado_presente.camiamarillo~regout\) # ((!\fin_largo~regout\ & \estado_presente.espera~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fff4",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fin_largo~regout\,
	datab => \estado_presente.espera~regout\,
	datac => \estado_presente.camiverde~regout\,
	datad => \estado_presente.camiamarillo~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Selector10~0_combout\);

-- Location: LC_X6_Y4_N1
\carretera[2]$latch\ : maxv_lcell
-- Equation(s):
-- \carretera[2]$latch~combout\ = (GLOBAL(\Selector8~0_combout\) & (((\Selector10~0_combout\)))) # (!GLOBAL(\Selector8~0_combout\) & (((\carretera[2]$latch~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f5a0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Selector8~0_combout\,
	datac => \Selector10~0_combout\,
	datad => \carretera[2]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \carretera[2]$latch~combout\);

-- Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rural[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \rural[0]$latch~combout\,
	oe => VCC,
	padio => ww_rural(0));

-- Location: PIN_A3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rural[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \rural[1]$latch~combout\,
	oe => VCC,
	padio => ww_rural(1));

-- Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\rural[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \rural[2]$latch~combout\,
	oe => VCC,
	padio => ww_rural(2));

-- Location: PIN_C5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\carretera[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \carretera[0]$latch~combout\,
	oe => VCC,
	padio => ww_carretera(0));

-- Location: PIN_A4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\carretera[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \carretera[1]$latch~combout\,
	oe => VCC,
	padio => ww_carretera(1));

-- Location: PIN_C6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\carretera[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \carretera[2]$latch~combout\,
	oe => VCC,
	padio => ww_carretera(2));
END structure;


