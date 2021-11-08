-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
-- Date        : Mon Nov  8 14:56:20 2021
-- Host        : MORGEN running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/28683/Desktop/clock/clock.srcs/sources_1/ip/dist_mem_gen_3/dist_mem_gen_3_stub.vhdl
-- Design      : dist_mem_gen_3
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dist_mem_gen_3 is
  Port ( 
    a : in STD_LOGIC_VECTOR ( 7 downto 0 );
    spo : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end dist_mem_gen_3;

architecture stub of dist_mem_gen_3 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a[7:0],spo[7:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dist_mem_gen_v8_0_11,Vivado 2017.2";
begin
end;
