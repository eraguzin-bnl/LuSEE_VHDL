-- -------------------------------------------------------------
-- 
-- File Name: /u/home/eraguzin/matlab/LNspec/matlab/codegen/spectrometer/hdlsrc/spectrometer_fixpt_pkg.vhd
-- Created: 2023-01-19 10:51:07
-- 
-- Generated by MATLAB 9.12, MATLAB Coder 5.4 and HDL Coder 3.20
-- 
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE spectrometer_fixpt_pkg IS
  TYPE vector_of_signed14 IS ARRAY (NATURAL RANGE <>) OF signed(13 DOWNTO 0);
  TYPE vector_of_signed32 IS ARRAY (NATURAL RANGE <>) OF signed(31 DOWNTO 0);
  TYPE vector_of_signed34 IS ARRAY (NATURAL RANGE <>) OF signed(33 DOWNTO 0);
  TYPE vector_of_signed36 IS ARRAY (NATURAL RANGE <>) OF signed(35 DOWNTO 0);
  TYPE vector_of_signed38 IS ARRAY (NATURAL RANGE <>) OF signed(37 DOWNTO 0);
  TYPE vector_of_signed40 IS ARRAY (NATURAL RANGE <>) OF signed(39 DOWNTO 0);
  TYPE vector_of_signed42 IS ARRAY (NATURAL RANGE <>) OF signed(41 DOWNTO 0);
  TYPE vector_of_std_logic_vector46 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(45 DOWNTO 0);
  TYPE vector_of_std_logic_vector34 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(33 DOWNTO 0);
  TYPE vector_of_std_logic_vector32 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(31 DOWNTO 0);
  TYPE vector_of_std_logic_vector14 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(13 DOWNTO 0);
  TYPE vector_of_std_logic_vector11 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(10 DOWNTO 0);
  TYPE vector_of_std_logic_vector6 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(5 DOWNTO 0);
  TYPE vector_of_std_logic_vector5 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(4 DOWNTO 0);
  TYPE vector_of_unsigned32 IS ARRAY (NATURAL RANGE <>) OF unsigned(31 DOWNTO 0);
  TYPE vector_of_unsigned11 IS ARRAY (NATURAL RANGE <>) OF unsigned(10 DOWNTO 0);
END spectrometer_fixpt_pkg;

