----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Thu Feb  9 11:34:55 2023
-- Testbench Template
-- This is a basic testbench that instantiates your design with basic 
-- clock and reset pins connected.  If your design has special
-- clock/reset or testbench driver requirements then you should 
-- copy this file and modify it. 
----------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: TWDL_ROM_test.vhd
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


library ieee;
use ieee.std_logic_1164.all;

entity TWDL_ROM_test is
end TWDL_ROM_test;

architecture behavioral of TWDL_ROM_test is

    constant SYSCLK_PERIOD : time := 100 ns; -- 10MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

    component TWDLROM_11_1
        -- ports
        port( 
            -- Inputs
            clk : in std_logic;
            reset : in std_logic;
            enb : in std_logic;
            dout_10_1_vld : in std_logic;
            softReset : in std_logic;

            -- Outputs
            twdl_11_1_re : out std_logic_vector(31 downto 0);
            twdl_11_1_im : out std_logic_vector(31 downto 0);
            twdl_11_1_vld : out std_logic

            -- Inouts

        );
    end component;

begin

    process
        variable vhdl_initial : BOOLEAN := TRUE;

    begin
        if ( vhdl_initial ) then
            -- Assert Reset
            NSYSRESET <= '1';
            wait for ( SYSCLK_PERIOD * 10 );
            
            NSYSRESET <= '0';
            wait;
        end if;
    end process;

    -- Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );

    -- Instantiate Unit Under Test:  TWDLROM_11_1
    TWDLROM_11_1_0 : TWDLROM_11_1
        -- port map
        port map( 
            -- Inputs
            clk => SYSCLK,
            reset => NSYSRESET,
            enb => '1',
            dout_10_1_vld => '0',
            softReset => NSYSRESET,

            -- Outputs
            twdl_11_1_re => open,
            twdl_11_1_im => open,
            twdl_11_1_vld =>  open

            -- Inouts

        );

end behavioral;

