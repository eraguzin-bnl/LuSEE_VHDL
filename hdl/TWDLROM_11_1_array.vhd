--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: TWDLROM_11_1_array.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::PolarFire> <Die::MPF300T> <Package::FCG1152>
-- Author: <Name>
--
--------------------------------------------------------------------------------

library IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


entity TWDLROM_11_1_array is
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        dout_10_1_vld                     :   IN    std_logic;
        softReset                         :   IN    std_logic;
        twdl_11_1_re                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
        twdl_11_1_im                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
        twdl_11_1_vld                     :   OUT   std_logic
        );
end TWDLROM_11_1_array;

architecture architecture_TWDLROM_11_1_array of TWDLROM_11_1_array is

type TWDLROM_11_CONSTANTS is array (0 TO 15) OF std_logic_vector(31 downto 0);

-- Try assigning values in one big block
constant TWDLROM_11_re : TWDLROM_11_CONSTANTS := (x"40000000", x"40000000", x"40000000", x"40000000", x"40000000", x"2D413CCD", x"00000000", x"D2BEC333", x"40000000", x"3b20d79e", x"2D413CCD", x"187DE2A7", x"40000000",x"187DE2A7" ,x"d2bec333",x"c4df2862");

constant TWDLROM_11_im : TWDLROM_11_CONSTANTS := (x"00000000", x"00000000", x"00000000", x"00000000", x"00000000", x"D2BEC333", x"C0000000", x"D2BEC333", x"00000000", x"E7821D59", x"D2BEC333", x"C4DF2862", x"00000000",x"C4DF2862",x"d2bec333", x"187DE2A7");


 SIGNAL Valid_s1          : std_logic;
 SIGNAL Valid_s2          : std_logic;
 SIGNAL index             : std_logic_vector(3 downto 0);
 
begin

PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Valid_s1      <= '0';
      Valid_s2      <= '0';
      twdl_11_1_vld <= '0';
      twdl_11_1_re  <= x"00000000";
      twdl_11_1_im  <= x"00000000";
      index         <= x"0";
    ELSIF clk'EVENT AND clk = '1' THEN
        Valid_s1    <= dout_10_1_vld;
        Valid_s2    <= Valid_s1;
        twdl_11_1_re      <= TWDLROM_11_re(CONV_INTEGER(unsigned(index )));
        twdl_11_1_im      <= TWDLROM_11_im(CONV_INTEGER(unsigned(index )));
        twdl_11_1_vld     <= Valid_s2;
        if(Valid_s2 = '1') then
            index  <= index + 1;
        end if;
    END IF;
  END PROCESS;



end architecture_TWDLROM_11_1_array;
