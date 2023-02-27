----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Sun Feb 12 20:11:37 2023
-- Testbench Template
-- This is a basic testbench that instantiates your design with basic 
-- clock and reset pins connected.  If your design has special
-- clock/reset or testbench driver requirements then you should 
-- copy this file and modify it. 
----------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: FFT_TST.vhd
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


entity FFT_TST is
end FFT_TST;

architecture behavioral of FFT_TST is

    constant SYSCLK_PERIOD : time := 100 ns; -- 10MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';
    signal count    :std_logic_vector(31 downto 0);
    
    
    component sfft_fixpt
        -- ports
        port( 
            -- Inputs
            clk : in std_logic;
            reset : in std_logic;
            clk_enable : in std_logic;
            c_re : in std_logic_vector(31 downto 0);
            c_im : in std_logic_vector(31 downto 0);

            -- Outputs
            ce_out : out std_logic;
            fft_out_re : out std_logic_vector(31 downto 0);
            fft_out_im : out std_logic_vector(31 downto 0);
            fft_valid : out std_logic

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

   
    process (SYSCLK) begin
            IF SYSCLK'EVENT AND SYSCLK = '1' THEN
                if (NSYSRESET = '1') then
                    count <= x"00000000";
                else
                    count <= count + 1;
                end if;
            end if;
    end process; 
    
    
    
    -- Instantiate Unit Under Test:  sfft_fixpt
    sfft_fixpt_0 : sfft_fixpt
        -- port map
        port map( 
            -- Inputs
            clk => SYSCLK,
            reset => NSYSRESET,
            clk_enable => '1',
            c_re => count,
            c_im => count(31 downto 4) & x"a",

            -- Outputs
            ce_out =>  open,
            fft_out_re => open,
            fft_out_im => open,
            fft_valid =>  open

            -- Inouts

        );

end behavioral;

