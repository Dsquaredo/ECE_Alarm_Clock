// Copyright (C) 2023  Intel Corporation. All rights reserved.
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
// VERSION		"Version 22.1std.1 Build 917 02/14/2023 SC Lite Edition"
// CREATED		"Mon Jun  3 12:14:31 2024"

module MAIN(
	Clock,
	Reset,
	Hours,
	Clock_Push,
	Alarm_Disable,
	Alarm_Mode,
	Minutes,
	Seconds,
	Alarm_Wipe,
	The_Alarm,
	Seg0,
	Seg1,
	Seg2,
	Seg3,
	Seg4,
	Seg5
);


input wire	Clock;
input wire	Reset;
input wire	Hours;
input wire	Clock_Push;
input wire	Alarm_Disable;
input wire	Alarm_Mode;
input wire	Minutes;
input wire	Seconds;
input wire	Alarm_Wipe;
output wire	The_Alarm;
output wire	[6:0] Seg0;
output wire	[6:0] Seg1;
output wire	[6:0] Seg2;
output wire	[6:0] Seg3;
output wire	[6:0] Seg4;
output wire	[6:0] Seg5;

wire	1hz;
wire	min;
wire	push;
wire	sec;
wire	Stop;
wire	switch;
wire	[3:0] SYNTHESIZED_WIRE_0;
wire	[3:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[3:0] SYNTHESIZED_WIRE_3;
wire	[4:0] SYNTHESIZED_WIRE_4;
wire	[5:0] SYNTHESIZED_WIRE_5;
wire	[5:0] SYNTHESIZED_WIRE_6;
wire	[4:0] SYNTHESIZED_WIRE_7;
wire	[5:0] SYNTHESIZED_WIRE_8;
wire	[5:0] SYNTHESIZED_WIRE_9;
wire	[3:0] SYNTHESIZED_WIRE_10;
wire	[3:0] SYNTHESIZED_WIRE_11;
wire	[5:0] SYNTHESIZED_WIRE_12;
wire	[5:0] SYNTHESIZED_WIRE_13;
wire	[4:0] SYNTHESIZED_WIRE_14;
wire	[3:0] SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;





one_second_clock	b2v_11(
	.clk_50MHz(Clock),
	.out1Hz(1hz));


seven_seg_decoder	b2v_inst(
	.binary_in(SYNTHESIZED_WIRE_0),
	.Seg(Seg0));


seven_seg_decoder	b2v_inst1(
	.binary_in(SYNTHESIZED_WIRE_1),
	.Seg(Seg1));


time_count	b2v_inst12(
	.clk_1hz(1hz),
	.reset(SYNTHESIZED_WIRE_2),
	.hours(SYNTHESIZED_WIRE_7),
	.minutes(SYNTHESIZED_WIRE_8),
	.seconds(SYNTHESIZED_WIRE_9));

assign	SYNTHESIZED_WIRE_2 =  ~Reset;


alarm_set	b2v_inst17(
	.clk(push),
	.reset(switch),
	.alarm_mode(Alarm_Mode),
	.inc_hours(Hours),
	.inc_minutes(min),
	.inc_seconds(sec),
	.alarm_hours(SYNTHESIZED_WIRE_4),
	.alarm_minutes(SYNTHESIZED_WIRE_5),
	.alarm_seconds(SYNTHESIZED_WIRE_6));


seven_seg_decoder	b2v_inst2(
	.binary_in(SYNTHESIZED_WIRE_3),
	.Seg(Seg2));


display_and_check	b2v_inst25(
	.alarm_mode(Alarm_Mode),
	.alarm_hours(SYNTHESIZED_WIRE_4),
	.alarm_minutes(SYNTHESIZED_WIRE_5),
	.alarm_seconds(SYNTHESIZED_WIRE_6),
	.hours(SYNTHESIZED_WIRE_7),
	.minutes(SYNTHESIZED_WIRE_8),
	.seconds(SYNTHESIZED_WIRE_9),
	.alarm_trigger(SYNTHESIZED_WIRE_16),
	.disp_hours(SYNTHESIZED_WIRE_14),
	.disp_minutes(SYNTHESIZED_WIRE_13),
	.disp_seconds(SYNTHESIZED_WIRE_12));


seven_seg_decoder	b2v_inst3(
	.binary_in(SYNTHESIZED_WIRE_10),
	.Seg(Seg3));


seven_seg_decoder	b2v_inst4(
	.binary_in(SYNTHESIZED_WIRE_11),
	.Seg(Seg4));


parser	b2v_inst5(
	.value(SYNTHESIZED_WIRE_12),
	.ones(SYNTHESIZED_WIRE_0),
	.tens(SYNTHESIZED_WIRE_1));


parser	b2v_inst6(
	.value(SYNTHESIZED_WIRE_13),
	.ones(SYNTHESIZED_WIRE_3),
	.tens(SYNTHESIZED_WIRE_10));


parserhour	b2v_inst7(
	.value(SYNTHESIZED_WIRE_14),
	.ones(SYNTHESIZED_WIRE_11),
	.tens(SYNTHESIZED_WIRE_15));


seven_seg_decoder	b2v_inst8(
	.binary_in(SYNTHESIZED_WIRE_15),
	.Seg(Seg5));


millers_planet	b2v_inst9(
	.start(SYNTHESIZED_WIRE_16),
	.stop(Stop),
	.clk(Clock),
	.out(The_Alarm));

assign	push = Clock_Push;
assign	switch = Alarm_Wipe;
assign	min = Minutes;
assign	sec = Seconds;
assign	Stop = Alarm_Disable;

endmodule
