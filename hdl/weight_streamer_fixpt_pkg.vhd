-- -------------------------------------------------------------
-- 
-- File Name: /u/home/eraguzin/matlab/LNspec/matlab/codegen/weight_streamer/hdlsrc/weight_streamer_fixpt_pkg.vhd
-- Created: 2023-01-19 10:52:54
-- 
-- Generated by MATLAB 9.12, MATLAB Coder 5.4 and HDL Coder 3.20
-- 
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE weight_streamer_fixpt_pkg IS
  TYPE vector_of_signed32 IS ARRAY (NATURAL RANGE <>) OF signed(31 DOWNTO 0);
END weight_streamer_fixpt_pkg;

