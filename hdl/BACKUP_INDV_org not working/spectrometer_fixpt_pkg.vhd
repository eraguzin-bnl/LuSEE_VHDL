-- -------------------------------------------------------------
-- 
-- File Name: /u/home/eraguzin/matlab/LNspec/matlab/codegen/spectrometer/hdlsrc/spectrometer_fixpt_pkg.vhd
-- Created: 2023-01-17 10:45:52
-- 
-- Generated by MATLAB 9.12, MATLAB Coder 5.4 and HDL Coder 3.20
-- 
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE spectrometer_fixpt_pkg IS
  TYPE vector_of_signed32 IS ARRAY (NATURAL RANGE <>) OF signed(31 DOWNTO 0);
  TYPE vector_of_signed34 IS ARRAY (NATURAL RANGE <>) OF signed(33 DOWNTO 0);
  TYPE vector_of_signed36 IS ARRAY (NATURAL RANGE <>) OF signed(35 DOWNTO 0);
  TYPE vector_of_signed38 IS ARRAY (NATURAL RANGE <>) OF signed(37 DOWNTO 0);
  TYPE vector_of_signed40 IS ARRAY (NATURAL RANGE <>) OF signed(39 DOWNTO 0);
  TYPE vector_of_signed42 IS ARRAY (NATURAL RANGE <>) OF signed(41 DOWNTO 0);
  TYPE vector_of_std_logic_vector32 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(31 DOWNTO 0);
  TYPE vector_of_unsigned12 IS ARRAY (NATURAL RANGE <>) OF unsigned(11 DOWNTO 0);
  TYPE vector_of_unsigned10 IS ARRAY (NATURAL RANGE <>) OF unsigned(9 DOWNTO 0);
  TYPE vector_of_unsigned32 IS ARRAY (NATURAL RANGE <>) OF unsigned(31 DOWNTO 0);
  TYPE vector_of_unsigned11 IS ARRAY (NATURAL RANGE <>) OF unsigned(10 DOWNTO 0);
  TYPE vector_of_unsigned35 IS ARRAY (NATURAL RANGE <>) OF unsigned(34 DOWNTO 0);
  TYPE vector_of_signed64 IS ARRAY (NATURAL RANGE <>) OF signed(63 DOWNTO 0);
END spectrometer_fixpt_pkg;

