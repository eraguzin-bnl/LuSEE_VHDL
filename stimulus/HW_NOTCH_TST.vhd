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
-- File: HW_NOTCH_TST.vhd
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
USE STD.textio.ALL;
use ieee.std_logic_textio.all;

entity HW_NOTCH_TST is
end HW_NOTCH_TST;

architecture behavioral of HW_NOTCH_TST is

    constant SYSCLK_PERIOD : time := 10 ns; -- 100MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

    signal pks_val             : vector_of_std_logic_vector32(0 TO 3);
    signal pks0                : std_logic_vector(31 downto 0);
    signal pks1                : std_logic_vector(31 downto 0);
    signal pks2                : std_logic_vector(31 downto 0);
    signal pks3                : std_logic_vector(31 downto 0);

    signal ch1_val_re          : std_logic_vector(31 DOWNTO 0);
    signal ch1_val_im          : std_logic_vector(31 DOWNTO 0);
    signal fft_ready           : std_logic;
    signal bin                 : std_logic_vector(15 DOWNTO 0);

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
        FILE ch1_re_file: TEXT;
        FILE ch1_im_file: TEXT;
        FILE fft_file: TEXT;
        FILE bin_file: TEXT;
        VARIABLE file_status: std_logic := '0';
        VARIABLE ch1_re_l: LINE;
        VARIABLE ch1_im_l: LINE;
        VARIABLE bin_l: LINE;
        VARIABLE fft_l: LINE;
        VARIABLE ch1_val_re_v: std_logic_vector(31 DOWNTO 0);
        VARIABLE ch1_val_im_v: std_logic_vector(31 DOWNTO 0);
        VARIABLE fft_ready_v: std_logic_vector(0 DOWNTO 0);
        VARIABLE bin_v: std_logic_vector(15 DOWNTO 0);

      BEGIN
      wait for SYSCLK_PERIOD;
        IF (file_status = '0') THEN
            report "Opening file";
            file_open(ch1_re_file, "ch1_re.txt", read_mode);
            file_open(ch1_im_file, "ch1_im.txt", read_mode);
            file_open(bin_file, "bin.txt", read_mode);
            file_open(fft_file, "fft_ready.txt", read_mode);
            file_status := '1';
        END IF;

        IF NSYSRESET = '0' AND NOT ENDFILE(ch1_re_file) THEN
        --report "reading line ";
            --ready <= '1';
            --bin_in_s <= std_logic_vector(to_unsigned(to_integer(unsigned(bin_in_s)) + 1, 13));
          READLINE(ch1_re_file, ch1_re_l);
          READLINE(ch1_im_file, ch1_im_l);
          READLINE(bin_file, bin_l);
          READLINE(fft_file, fft_l);
          HREAD(ch1_re_l, ch1_val_re_v);
          HREAD(ch1_im_l, ch1_val_im_v);
          HREAD(bin_l, bin_v);
          HREAD(fft_l, fft_ready_v);
          ch1_val_re <= ch1_val_re_v;
          ch1_val_im <= ch1_val_im_v;
          bin <= bin_v;
          fft_ready <= fft_ready_v(0);
          --report "value is " & to_hex_string(read_data);
          --report "sample1v is " & to_hex_string(sample1_v);
          --report "sample2v is " & to_hex_string(sample2_v);
        END IF;

        IF ENDFILE(ch1_re_file) THEN
          report "VHDL --> Sample input file ended, restarting";
          file_close(ch1_re_file);
          file_close(ch1_im_file);
          file_close(bin_file);
          file_close(fft_file);
          file_status := '0';
        END IF;

      END PROCESS c_re_fileread;

    -- Instantiate Unit Under Test:  spectrometer_fixpt
    hw_notch_pf : entity work.spectrometer_half
        -- port map
        port map(
            -- Inputs
            clk => SYSCLK,
            reset => NSYSRESET,
            clk_enable => '1',
            Navg_notch  =>  "00" & x"04",
            Navg_main   =>  "00" & x"06",
            --sample1 => x"0" & sample1(13 downto 4),
            --sample2 => x"0" & sample2(13 downto 4),
            ch1_val_re_in   => ch1_val_re,
            ch1_val_im_in   => ch1_val_im,
            bin_in          => bin(12 downto 0),
            fft_ready_in    => fft_ready,

            notch_en    => '1',
            index_array => corr_array,
            index_array_notch => notch_array,

            -- Outputs
            ce_out =>  open,
            pks0 => open,
            pks1 => open,
            pks2 => open,
            pks3 => open,
            outbin => open,
            ready =>  open

            -- Inouts

        );

end behavioral;
