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
USE IEEE.numeric_std.ALL;
USE work.spectrometer_fixpt_pkg.ALL;

--For reading file
LIBRARY STD;
USE STD.textio.ALL;

entity SPEC_TST is
end SPEC_TST;

architecture behavioral of SPEC_TST is

    constant SYSCLK_PERIOD : time := 100 ns; -- 10MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';
    
    signal pks_val             : vector_of_std_logic_vector32(0 TO 3);
    signal pks0                : std_logic_vector(31 downto 0);
    signal pks1                : std_logic_vector(31 downto 0);
    signal pks2                : std_logic_vector(31 downto 0);
    signal pks3                : std_logic_vector(31 downto 0);

    SIGNAL sample1             : std_logic_vector(13 DOWNTO 0);
    SIGNAL sample2             : std_logic_vector(13 DOWNTO 0);

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
            pks    : out vector_of_std_logic_vector32(0 TO 3);
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
    
    --Needs to be split up so that ModelSim can see them
    pks0 <= pks_val(0);
    pks1 <= pks_val(1);
    pks2 <= pks_val(2);
    pks3 <= pks_val(3);

    -- Data source for adc
      c_re_fileread: PROCESS
        FILE fp: TEXT;
        VARIABLE file_status: std_logic := '0';
        VARIABLE l: LINE;
        VARIABLE read_data: std_logic_vector(31 DOWNTO 0);
        VARIABLE sample1_v: std_logic_vector(13 DOWNTO 0);
        VARIABLE sample2_v: std_logic_vector(13 DOWNTO 0);
        

      BEGIN
      wait for SYSCLK_PERIOD;
        IF (file_status = '0') THEN
            report "Opening file";
            file_open(fp, "data_fixed.txt", read_mode);
            file_status := '1';
        END IF;
        
        IF NSYSRESET = '0' AND NOT ENDFILE(fp) THEN
        --report "reading line ";
          READLINE(fp, l);
          HREAD(l, read_data);
          sample1_v := read_data(29 downto 16);
          sample2_v := read_data(13 downto 0);
          sample1 <= sample1_v;
          sample2 <= sample2_v;
          --report "value is " & to_hex_string(read_data);
          --report "sample1v is " & to_hex_string(sample1_v);
          --report "sample2v is " & to_hex_string(sample2_v);
        END IF;
        
        IF ENDFILE(fp) THEN
          report "VHDL --> Sample input file ended, restarting";
          file_close(fp);
          file_status := '0';
        END IF;
        
      END PROCESS c_re_fileread;

    -- Instantiate Unit Under Test:  spectrometer_fixpt
    spectrometer_fixpt_0 : spectrometer_fixpt
        -- port map
        port map( 
            -- Inputs
            clk => SYSCLK,
            reset => NSYSRESET,
            clk_enable => '1',
            Navg => "00" & x"04",
            sample1 => sample1,
            sample2 => sample2,
            nstart => '1',
            Streamer_DLY => (others=> '0'),
            weight_fold_DLY => (others=> '0'),
            sfft_DLY => (others=> '0'),
            deinterlace_DLY => (others=> '0'),
            AVG_DLY => (others=> '0'),

            -- Outputs
            ce_out =>  open,
            pks => pks_val,
            outbin => open,
            ready =>  open

            -- Inouts

        );

end behavioral;
