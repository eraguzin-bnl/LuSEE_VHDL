----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Thu Nov 10 15:24:41 2022
-- Testbench Template
-- This is a basic testbench that instantiates your design with basic 
-- clock and reset pins connected.  If your design has special
-- clock/reset or testbench driver requirements then you should 
-- copy this file and modify it. 
----------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: ADS4245_tst.vhd
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

entity ADS4245_tst is
end ADS4245_tst;

architecture behavioral of ADS4245_tst is

    constant SYSCLK_PERIOD : time := 100 ns; -- 10MHZ

    signal SYSCLK           : std_logic := '0';
    signal NSYSRESET        : std_logic := '0';
    signal ADC_REG_START    : std_logic := '0';
    
    
    component ADS4245_CNTL
        -- ports
        port( 
            -- Inputs
            Reset : in std_logic;
            Sample_CLK : in std_logic;
            ADC_CLKOUT : in std_logic;
            ADC_DATA_IN : in std_logic_vector(13 downto 0);
            ADC_REG_START : in std_logic;
            ADC_REG_ADDR : in std_logic_vector(7 downto 0);
            ADC_REG_DIN : in std_logic_vector(7 downto 0);
            ADC_SDOUT : in std_logic;

            -- Outputs
            ADC_CLK : out std_logic;
            ADC_REG_DOUT : out std_logic_vector(7 downto 0);
            ADC_Reset : out std_logic;
            ADC_SDATA : out std_logic;
            ADC_SEN : out std_logic;
            ADC_SCLK : out std_logic;
            ADC_DATA_A : out std_logic_vector(13 downto 0);
            ADC_DATA_B : out std_logic_vector(13 downto 0);
            ADC_S_CLK : out std_logic

            -- Inouts

        );
    end component;

begin

    process
        variable vhdl_initial : BOOLEAN := TRUE;

    begin
        if ( vhdl_initial ) then
            -- Assert Reset
            NSYSRESET       <= '0';
            ADC_REG_START   <= '0';
            wait for ( SYSCLK_PERIOD * 10 );
            NSYSRESET <= '1';
            
            wait for 1us;
            ADC_REG_START   <= '1';
            wait for 1us;
            ADC_REG_START   <= '0';
            wait;
        end if;
    end process;

    -- Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );

    -- Instantiate Unit Under Test:  ADS4245_CNTL
    ADS4245_CNTL_0 : ADS4245_CNTL
        -- port map
        port map( 
            -- Inputs
            Reset => NSYSRESET,
            Sample_CLK => SYSCLK,
            ADC_CLKOUT => SYSCLK,
            ADC_DATA_IN => (others=> '0'),
            ADC_REG_START => ADC_REG_START ,
            ADC_REG_ADDR => x"80",
            ADC_REG_DIN => x"01",
            ADC_SDOUT => '0',

            -- Outputs
            ADC_CLK =>  open,
            ADC_REG_DOUT => open,
            ADC_Reset =>  open,
            ADC_SDATA =>  open,
            ADC_SEN =>  open,
            ADC_SCLK =>  open,
            ADC_DATA_A => open,
            ADC_DATA_B => open,
            ADC_S_CLK =>  open

            -- Inouts

        );

end behavioral;

