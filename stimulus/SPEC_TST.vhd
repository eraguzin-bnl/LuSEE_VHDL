----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Sun Feb 12 20:02:50 2023
-- Testbench Template
-- This is a basic testbench that instantiates your design with basic 
-- clock and reset pins connected.  If your design has special
-- clock/reset or testbench driver requirements then you should 
-- copy this file and modify it. 
----------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: SPEC_TST.vhd
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

entity SPEC_TST is
end SPEC_TST;

architecture behavioral of SPEC_TST is

    constant SYSCLK_PERIOD : time := 100 ns; -- 10MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

    component spectrometer_fixpt
        -- ports
        port( 
            -- Inputs
            clk : in std_logic;
            reset : in std_logic;
            clk_enable : in std_logic;
            Navg : in std_logic_vector(9 downto 0);
            sample1 : in std_logic_vector(13 downto 0);
            sample2 : in std_logic_vector(13 downto 0);
            nstart : in std_logic;
            Streamer_DLY : in std_logic_vector(3 downto 0);
            weight_fold_DLY : in std_logic_vector(3 downto 0);
            sfft_DLY : in std_logic_vector(3 downto 0);
            deinterlace_DLY : in std_logic_vector(3 downto 0);
            AVG_DLY : in std_logic_vector(3 downto 0);

            -- Outputs
            ce_out : out std_logic;
            \pks[0]\ : out std_logic_vector(31 downto 0);
            \pks[1]\ : out std_logic_vector(31 downto 0);
            \pks[2]\ : out std_logic_vector(31 downto 0);
            \pks[3]\ : out std_logic_vector(31 downto 0);
            outbin : out std_logic_vector(10 downto 0);
            ready : out std_logic

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

    -- Instantiate Unit Under Test:  spectrometer_fixpt
    spectrometer_fixpt_0 : spectrometer_fixpt
        -- port map
        port map( 
            -- Inputs
            clk => SYSCLK,
            reset => NSYSRESET,
            clk_enable => SYSCLK,
            Navg => (others=> '0'),
            sample1 => b"01" & x"123",
            sample2 => b"01" & x"abc",
            nstart => '1',
            Streamer_DLY => (others=> '0'),
            weight_fold_DLY => (others=> '0'),
            sfft_DLY => (others=> '0'),
            deinterlace_DLY => (others=> '0'),
            AVG_DLY => (others=> '0'),

            -- Outputs
            ce_out =>  open,
            \pks[0]\ => open,
            \pks[1]\ => open,
            \pks[2]\ => open,
            \pks[3]\ => open,
            outbin => open,
            ready =>  open

            -- Inouts

        );

end behavioral;

