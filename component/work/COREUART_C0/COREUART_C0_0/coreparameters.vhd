----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Wed Nov 30 17:32:54 2022
-- Parameters for COREUART
----------------------------------------------------------------------


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

package coreparameters is
    constant BAUD_VAL_FRCTN_EN : integer := 1;
    constant FAMILY : integer := 26;
    constant HDL_license : string( 1 to 1 ) := "U";
    constant RX_FIFO : integer := 0;
    constant RX_LEGACY_MODE : integer := 0;
    constant testbench : string( 1 to 4 ) := "User";
    constant TX_FIFO : integer := 0;
    constant USE_SOFT_FIFO : integer := 0;
end coreparameters;
