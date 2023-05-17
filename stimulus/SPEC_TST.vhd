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
--Tried to use these methods of reading binary file:
--http://www.ece.ualberta.ca/~elliott/ee552/studentAppNotes/2000_w/vhdl/BinaryFileTestbenching/binary.html
--https://electronics.stackexchange.com/questions/258964/can-vhdl-read-binary-files-i-e-non-text-files
--https://stackoverflow.com/questions/14173652/how-can-i-read-binary-data-in-vhdl-modelsim-whithout-using-special-binary-format
--Was getting this error:
--https://support.xilinx.com/s/question/0D52E00006hpYSSSA2/vhdl-standard-read-procedure?language=en_US
--Even after uncommenting std_logic_textio and commenting textio.all
--So I have to use characters to read byte data from the file
library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.ALL;
USE work.spectrometer_fixpt_pkg.ALL;

--For reading file
LIBRARY STD;
--USE STD.textio.ALL;
--use ieee.std_logic_textio.all;

entity SPEC_TST is
end SPEC_TST;

architecture behavioral of SPEC_TST is

    constant SYSCLK_PERIOD : time := 10 ns; -- 100MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';
    
    signal pks_val             : vector_of_std_logic_vector32(0 TO 3);
    signal pks0                : std_logic_vector(31 downto 0);
    signal pks1                : std_logic_vector(31 downto 0);
    signal pks2                : std_logic_vector(31 downto 0);
    signal pks3                : std_logic_vector(31 downto 0);

    SIGNAL sample1             : std_logic_vector(13 DOWNTO 0);
    SIGNAL sample2             : std_logic_vector(13 DOWNTO 0);
    SIGNAL sample3             : std_logic_vector(13 DOWNTO 0);
    
    SIGNAL corr_array         : vector_of_std_logic_vector5(15 downto 0);
    SIGNAL notch_array        : vector_of_std_logic_vector5(15 downto 0);

begin

    process
        variable vhdl_initial : BOOLEAN := TRUE;

    begin
        if ( vhdl_initial ) then
            -- Assert Reset
            NSYSRESET <= '1';
            corr_array(0)      <= "11111";
            corr_array(1)      <= "01000";
            corr_array(2)      <= "00000";
            corr_array(3)      <= "00000";
            corr_array(4)      <= "00000";
            corr_array(5)      <= "00000";
            corr_array(6)      <= "00000";
            corr_array(7)      <= "00000";
            corr_array(8)      <= "00000";
            corr_array(9)      <= "00000";
            corr_array(10)      <= "00000";
            corr_array(11)      <= "00000";
            corr_array(12)      <= "00000";
            corr_array(13)      <= "00000";
            corr_array(14)      <= "00000";
            corr_array(15)      <= "00000";
            
            notch_array(0)      <= "11111";
            notch_array(1)      <= "01000";
            notch_array(2)      <= "00000";
            notch_array(3)      <= "00000";
            notch_array(4)      <= "00000";
            notch_array(5)      <= "00000";
            notch_array(6)      <= "00000";
            notch_array(7)      <= "00000";
            notch_array(8)      <= "00000";
            notch_array(9)      <= "00000";
            notch_array(10)      <= "00000";
            notch_array(11)      <= "00000";
            notch_array(12)      <= "00000";
            notch_array(13)      <= "00000";
            notch_array(14)      <= "00000";
            notch_array(15)      <= "00000";
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
        type two_byte_file is file of character;
        file sky_100 : two_byte_file;
        file sky_pf_100 : two_byte_file;
        file comb : two_byte_file;
        VARIABLE file_status: std_logic := '0';
        --VARIABLE l: LINE;
        VARIABLE read_data: character;
        VARIABLE read_data2: character;
        VARIABLE read_data3: character;
        VARIABLE read_data4: character;
        VARIABLE sample1_v: std_logic_vector(15 DOWNTO 0);
        VARIABLE sample2_v: std_logic_vector(15 DOWNTO 0);
        VARIABLE read_data5: character;
        VARIABLE read_data6: character;
        VARIABLE comb_v: std_logic_vector(15 DOWNTO 0);
        

      BEGIN
      wait for SYSCLK_PERIOD;
        IF (file_status = '0') THEN
            report "Opening file";
            file_open(sky_100, "sky_100.bin", read_mode);
            file_open(sky_pf_100, "sky_pf_100.bin", read_mode);
            file_open(comb, "drifting_comb.bin", read_mode);
            file_status := '1';
        END IF;
        
        IF NSYSRESET = '0' AND NOT ENDFILE(sky_100) THEN
        --report "reading line ";
          READ(sky_100, read_data3);
          READ(sky_100, read_data4);
          READ(sky_pf_100, read_data);
          READ(sky_pf_100, read_data2);
          --READ(comb, read_data5);
          --READ(comb, read_data6);
          sample1_v := std_logic_vector(to_unsigned(character'pos(read_data),8)) & std_logic_vector(to_unsigned(character'pos(read_data2),8));
          sample2_v := std_logic_vector(to_unsigned(character'pos(read_data3),8)) & std_logic_vector(to_unsigned(character'pos(read_data4),8));
          --comb_v := std_logic_vector(to_unsigned(character'pos(read_data5),8)) & std_logic_vector(to_unsigned(character'pos(read_data6),8));
          
          sample1 <= sample1_v(7 downto 0) & sample1_v(15 downto 10);
          sample2 <= sample2_v(7 downto 0) & sample2_v(15 downto 10);
          --sample3 <= comb_v(5 downto 0) & comb_v(15 downto 8);
          
          --report "value is " & to_hex_string(read_data);
          --report "sample1v is " & to_hex_string(sample1_v);
          --report "sample2v is " & to_hex_string(sample2_v);
        END IF;
        
        IF ENDFILE(sky_100) THEN
          report "VHDL --> Sample input file ended, restarting";
          file_close(sky_100);
          file_close(sky_pf_100);
          file_status := '0';
        END IF;
        
        --IF ENDFILE(comb) THEN
          --report "VHDL --> Comb input file ended, restarting";
          --file_close(comb);
          --file_status := '0';
        --END IF;
        
      END PROCESS c_re_fileread;

    -- Instantiate Unit Under Test:  spectrometer_fixpt
    spec_notch_pf : entity work.spectrometer_fixpt
        -- port map
        port map( 
            -- Inputs
            clk => SYSCLK,
            reset => NSYSRESET,
            clk_enable => '1',
            Navg_notch  =>  "00" & x"02",
            Navg_main   =>  "00" & x"03",
            --sample1 => x"0" & sample1(13 downto 4),
            --sample2 => x"0" & sample2(13 downto 4),
            sample1 => sample1,
            sample2 => sample2,
            nstart => '1',
            Streamer_DLY => x"2",
            weight_fold_DLY => x"2",
            sfft_DLY => x"3",
            deinterlace_DLY => (others=> '0'),
            AVG_DLY => (others=> '0'),
            
            notch_en    => '1',
            index_array => corr_array,
            index_array_notch => corr_array,

            -- Outputs
            ce_out =>  open,
            pks => open,
            outbin => open,
            ready =>  open

            -- Inouts

        );
        
    spec_notch_nopf : entity work.spectrometer_fixpt
        -- port map
        port map( 
            -- Inputs
            clk => SYSCLK,
            reset => NSYSRESET,
            clk_enable => '1',
            Navg_notch  =>  "00" & x"04",
            Navg_main   =>  "00" & x"07",
            --sample1 => x"0" & sample2(13 downto 4),
            --sample2 => x"0" & sample1(13 downto 4),
            sample1 => sample2,
            sample2 => sample1,
            nstart => '1',
            Streamer_DLY => x"2",
            weight_fold_DLY => x"2",
            sfft_DLY => x"3",
            deinterlace_DLY => (others=> '0'),
            AVG_DLY => (others=> '0'),
            
            notch_en    => '1',
            index_array => corr_array,
            index_array_notch => corr_array,

            -- Outputs
            ce_out =>  open,
            pks => open,
            outbin => open,
            ready =>  open

            -- Inouts

        );
        
    spec_nonotch_pf : entity work.spectrometer_fixpt
        -- port map
        port map( 
            -- Inputs
            clk => SYSCLK,
            reset => NSYSRESET,
            clk_enable => '1',
            Navg_notch  =>  "00" & x"04",
            Navg_main   =>  "00" & x"07",
            --sample1 => x"0" & sample1(13 downto 4),
            --sample2 => x"0" & sample2(13 downto 4),
            sample1 => sample1,
            sample2 => sample2,
            nstart => '1',
            Streamer_DLY => x"2",
            weight_fold_DLY => x"2",
            sfft_DLY => x"3",
            deinterlace_DLY => (others=> '0'),
            AVG_DLY => (others=> '0'),
            
            notch_en    => '0',
            index_array => corr_array,
            index_array_notch => corr_array,

            -- Outputs
            ce_out =>  open,
            pks => open,
            outbin => open,
            ready =>  open

            -- Inouts

        );
        
    spec_nonotch_nopf : entity work.spectrometer_fixpt
        -- port map
        port map( 
            -- Inputs
            clk => SYSCLK,
            reset => NSYSRESET,
            clk_enable => '1',
            Navg_notch  =>  "00" & x"04",
            Navg_main   =>  "00" & x"07",
            --sample1 => x"0" & sample2(13 downto 4),
            --sample2 => x"0" & sample1(13 downto 4),
            sample1 => sample2,
            sample2 => sample1,
            nstart => '1',
            Streamer_DLY => x"2",
            weight_fold_DLY => x"2",
            sfft_DLY => x"3",
            deinterlace_DLY => (others=> '0'),
            AVG_DLY => (others=> '0'),
            
            notch_en    => '0',
            index_array => corr_array,
            index_array_notch => corr_array,

            -- Outputs
            ce_out =>  open,
            pks => open,
            outbin => open,
            ready =>  open

            -- Inouts

        );

end behavioral;
