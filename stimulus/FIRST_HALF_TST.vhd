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
USE STD.textio.ALL;
use ieee.std_logic_textio.all;

entity FIRST_HALF_TST is
end FIRST_HALF_TST;

architecture behavioral of FIRST_HALF_TST is

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
    
    SIGNAL w1                 : std_logic_vector(31 downto 0);
    SIGNAL w2                 : std_logic_vector(31 downto 0);
    SIGNAL w3                 : std_logic_vector(31 downto 0);
    SIGNAL w4                 : std_logic_vector(31 downto 0);
    SIGNAL val1               : std_logic_vector(31 downto 0);
    SIGNAL val2               : std_logic_vector(31 downto 0);
    SIGNAL fft_valid          : std_logic;
    SIGNAL fft_val_r          : std_logic_vector(31 downto 0);
    SIGNAL fft_val_i          : std_logic_vector(31 downto 0);
    SIGNAL fft_ready          : std_logic;
    SIGNAL ch1_val_re         : std_logic_vector(31 downto 0);
    SIGNAL ch1_val_im         : std_logic_vector(31 downto 0);
    SIGNAL ch2_val_re         : std_logic_vector(31 downto 0);
    SIGNAL ch2_val_im         : std_logic_vector(31 downto 0);
    SIGNAL bin                : std_logic_vector(12 downto 0);

begin

    w1 <= <<signal .FIRST_HALF_TST.spec_notch_pf.w1 : std_logic_vector(31 downto 0)>>;
    w2 <= <<signal .FIRST_HALF_TST.spec_notch_pf.w2 : std_logic_vector(31 downto 0)>>;
    w3 <= <<signal .FIRST_HALF_TST.spec_notch_pf.w3 : std_logic_vector(31 downto 0)>>;
    w4 <= <<signal .FIRST_HALF_TST.spec_notch_pf.w4 : std_logic_vector(31 downto 0)>>;
    val1 <= <<signal .FIRST_HALF_TST.spec_notch_pf.val1 : std_logic_vector(31 downto 0)>>;
    val2 <= <<signal .FIRST_HALF_TST.spec_notch_pf.val2 : std_logic_vector(31 downto 0)>>;
    fft_valid <= <<signal .FIRST_HALF_TST.spec_notch_pf.fft_valid : std_logic>>;
    fft_val_r <= <<signal .FIRST_HALF_TST.spec_notch_pf.fft_val_r : std_logic_vector(31 downto 0)>>;
    fft_val_i <= <<signal .FIRST_HALF_TST.spec_notch_pf.fft_val_i : std_logic_vector(31 downto 0)>>;
    fft_ready <= <<signal .FIRST_HALF_TST.spec_notch_pf.fft_ready : std_logic>>;
    ch1_val_re <= <<signal .FIRST_HALF_TST.spec_notch_pf.ch1_val_re : std_logic_vector(31 downto 0)>>;
    ch1_val_im <= <<signal .FIRST_HALF_TST.spec_notch_pf.ch1_val_im : std_logic_vector(31 downto 0)>>;
    ch2_val_re <= <<signal .FIRST_HALF_TST.spec_notch_pf.ch2_val_re : std_logic_vector(31 downto 0)>>;
    ch2_val_im <= <<signal .FIRST_HALF_TST.spec_notch_pf.ch2_val_im : std_logic_vector(31 downto 0)>>;
    bin <= <<signal .FIRST_HALF_TST.spec_notch_pf.bin : std_logic_vector(12 downto 0)>>;
    
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
        FILE sample1_file: TEXT;
        FILE sample2_file: TEXT;
        FILE w1_file: TEXT;
        FILE w2_file: TEXT;
        FILE w3_file: TEXT;
        FILE w4_file: TEXT;
        FILE val1_file: TEXT;
        FILE val2_file: TEXT;
        FILE fft_valid_file: TEXT;
        FILE fft_val_r_file: TEXT;
        FILE fft_val_i_file: TEXT;
        FILE fft_ready_file: TEXT;
        FILE ch1_val_re_file: TEXT;
        FILE ch1_val_im_file: TEXT;
        FILE ch2_val_re_file: TEXT;
        FILE ch2_val_im_file: TEXT;
        FILE bin_file: TEXT;
        VARIABLE file_status: std_logic := '0';
        
        VARIABLE sample1_l: LINE;
        VARIABLE sample2_l: LINE;
        VARIABLE w1_l: LINE;
        VARIABLE w2_l: LINE;
        VARIABLE w3_l: LINE;
        VARIABLE w4_l: LINE;
        VARIABLE val1_l: LINE;
        VARIABLE val2_l: LINE;
        VARIABLE fft_valid_l: LINE;
        VARIABLE fft_val_r_l: LINE;
        VARIABLE fft_val_i_l: LINE;
        VARIABLE fft_ready_l: LINE;
        VARIABLE ch1_val_re_l: LINE;
        VARIABLE ch1_val_im_l: LINE;
        VARIABLE ch2_val_re_l: LINE;
        VARIABLE ch2_val_im_l: LINE;
        VARIABLE bin_l: LINE;
        
        VARIABLE sample1_v            : std_logic_vector(13 downto 0);
        VARIABLE sample2_v            : std_logic_vector(13 downto 0);
        VARIABLE w1_v                 : std_logic_vector(31 downto 0);
        VARIABLE w2_v                 : std_logic_vector(31 downto 0);
        VARIABLE w3_v                 : std_logic_vector(31 downto 0);
        VARIABLE w4_v                 : std_logic_vector(31 downto 0);
        VARIABLE val1_v               : std_logic_vector(31 downto 0);
        VARIABLE val2_v               : std_logic_vector(31 downto 0);
        VARIABLE fft_valid_v          : std_logic_vector(3 downto 0);
        VARIABLE fft_val_r_v          : std_logic_vector(31 downto 0);
        VARIABLE fft_val_i_v          : std_logic_vector(31 downto 0);
        VARIABLE fft_ready_v          : std_logic_vector(3 downto 0);
        VARIABLE ch1_val_re_v         : std_logic_vector(31 downto 0);
        VARIABLE ch1_val_im_v         : std_logic_vector(31 downto 0);
        VARIABLE ch2_val_re_v         : std_logic_vector(31 downto 0);
        VARIABLE ch2_val_im_v         : std_logic_vector(31 downto 0);
        VARIABLE bin_v                : std_logic_vector(12 downto 0);
        
        VARIABLE loop_num             : integer range 0 to 18000 := 0;
      BEGIN
      --wait for SYSCLK_PERIOD;
        IF (file_status = '0') THEN
            report "Opening file";
            file_open(sample1_file, "sample1.txt", read_mode);
            file_open(sample2_file, "sample2.txt", read_mode);
            file_open(w1_file, "w1.txt", read_mode);
            file_open(w2_file, "w2.txt", read_mode);
            file_open(w3_file, "w3.txt", read_mode);
            file_open(w4_file, "w4.txt", read_mode);
            file_open(val1_file, "val1.txt", read_mode);
            file_open(val2_file, "val2.txt", read_mode);
            file_open(fft_valid_file, "fft_valid.txt", read_mode);
            file_open(fft_val_r_file, "fft_val_r.txt", read_mode);
            file_open(fft_val_i_file, "fft_val_i.txt", read_mode);
            file_open(fft_ready_file, "fft_ready.txt", read_mode);
            file_open(ch1_val_re_file, "ch1_val_re.txt", read_mode);
            file_open(ch1_val_im_file, "ch1_val_im.txt", read_mode);
            file_open(ch2_val_re_file, "ch2_val_re.txt", read_mode);
            file_open(ch2_val_im_file, "ch2_val_im.txt", read_mode);
            file_open(bin_file, "bin.txt", read_mode);
            file_status := '1';
        END IF;
        
        --IF NSYSRESET = '0' AND NOT ENDFILE(sample1_file) THEN
        IF NOT ENDFILE(sample1_file) THEN
        --report "reading line ";
          READLINE(sample1_file, sample1_l);
          READLINE(sample2_file, sample2_l);
          READLINE(w1_file, w1_l);
          READLINE(w2_file, w2_l);
          READLINE(w3_file, w3_l);
          READLINE(w4_file, w4_l);
          
          HREAD(sample1_l, sample1_v);
          HREAD(sample2_l, sample2_v);
          HREAD(w1_l, w1_v);
          HREAD(w2_l, w2_v);
          HREAD(w3_l, w3_v);
          HREAD(w4_l, w4_v);
          
          if ((loop_num = 0) or (loop_num > 7)) then
              READLINE(val1_file, val1_l);
              READLINE(val2_file, val2_l);
              
              READLINE(fft_valid_file, fft_valid_l);
              READLINE(fft_val_r_file, fft_val_r_l);
              READLINE(fft_val_i_file, fft_val_i_l);
          
              HREAD(val1_l, val1_v);
              HREAD(val2_l, val2_v);
              
              HREAD(fft_valid_l, fft_valid_v);
              HREAD(fft_val_r_l, fft_val_r_v);
              HREAD(fft_val_i_l, fft_val_i_v);
          end if;
          
          if ((loop_num = 0) or (loop_num > 12)) then
              READLINE(fft_ready_file, fft_ready_l);
              READLINE(ch1_val_re_file, ch1_val_re_l);
              READLINE(ch1_val_im_file, ch1_val_im_l);
              READLINE(ch2_val_re_file, ch2_val_re_l);
              READLINE(ch2_val_im_file, ch2_val_im_l);
              READLINE(bin_file, bin_l);
              
              HREAD(fft_ready_l, fft_ready_v);
              HREAD(ch1_val_re_l, ch1_val_re_v);
              HREAD(ch1_val_im_l, ch1_val_im_v);
              HREAD(ch2_val_re_l, ch2_val_re_v);
              HREAD(ch2_val_im_l, ch2_val_im_v);
              HREAD(bin_l, bin_v);
          end if;
          
          sample1 <= sample1_v;
          sample2 <= sample2_v;
          
        --report "Expecting " & to_hstring(w1_v);
        --report "Getting " & to_hstring(w1);
            if (w1 /= w1_v) then
                REPORT "Error in w1: Expected " & to_hstring(w1_v) & (" Actual " & to_hstring(w1))
                SEVERITY ERROR;
            end if;
            
            if (w2 /= w2_v) then
                REPORT "Error in w2: Expected " & to_hstring(w2_v) & (" Actual " & to_hstring(w2))
                SEVERITY ERROR;
            end if;
            
            if (w3 /= w3_v) then
                REPORT "Error in w3: Expected " & to_hstring(w3_v) & (" Actual " & to_hstring(w3))
                SEVERITY ERROR;
            end if;
            
            if (w4 /= w4_v) then
                REPORT "Error in w4: Expected " & to_hstring(w4_v) & (" Actual " & to_hstring(w4))
                SEVERITY ERROR;
            end if;
            
            if (val1 /= val1_v) then
                REPORT "Error in val1: Expected " & to_hstring(val1_v) & (" Actual " & to_hstring(val1))
                SEVERITY ERROR;
            end if;
            
            if (val2 /= val2_v) then
                REPORT "Error in val2: Expected " & to_hstring(val2_v) & (" Actual " & to_hstring(val2))
                SEVERITY ERROR;
            end if;
            
            if (fft_valid /= fft_valid_v(0)) then
                REPORT "Error in fft_valid: Expected " & to_hstring(fft_valid_v) & (" Actual " & std_logic'image(fft_valid))
                SEVERITY ERROR;
            end if;
            
            if (fft_val_r /= fft_val_r_v) then
                REPORT "Error in fft_val_r: Expected " & to_hstring(fft_val_r_v) & (" Actual " & to_hstring(fft_val_r))
                SEVERITY ERROR;
            end if;
            
            if (fft_val_i /= fft_val_i_v) then
                REPORT "Error in fft_val_i: Expected " & to_hstring(fft_val_i_v) & (" Actual " & to_hstring(fft_val_i))
                SEVERITY ERROR;
            end if;
            
            if (fft_ready /= fft_ready_v(0)) then
                REPORT "Error in fft_ready: Expected " & to_hstring(fft_ready_v) & (" Actual " & std_logic'image(fft_ready))
                SEVERITY ERROR;
            end if;
            
            if (ch1_val_re /= ch1_val_re_v) then
                REPORT "Error in ch1_val_re: Expected " & to_hstring(ch1_val_re_v) & (" Actual " & to_hstring(ch1_val_re))
                SEVERITY ERROR;
            --else
                --REPORT "Well would you look at that for ch1_val_re: Expected " & to_hstring(ch1_val_re_v) & (" Actual " & to_hstring(ch1_val_re))
                --SEVERITY NOTE;
            end if;
            
            if (ch1_val_im /= ch1_val_im_v) then
                REPORT "Error in ch1_val_im: Expected " & to_hstring(ch1_val_im_v) & (" Actual " & to_hstring(ch1_val_im))
                SEVERITY ERROR;
            --else
                --REPORT "Well would you look at that for ch1_val_im: Expected " & to_hstring(ch1_val_im_v) & (" Actual " & to_hstring(ch1_val_im))
                --SEVERITY NOTE;
            end if;
            
            if (ch2_val_re /= ch2_val_re_v) then
                REPORT "Error in ch2_val_re: Expected " & to_hstring(ch2_val_re_v) & (" Actual " & to_hstring(ch2_val_re))
                SEVERITY ERROR;
            end if;
            
            if (ch2_val_im /= ch2_val_im_v) then
                REPORT "Error in ch2_val_im: Expected " & to_hstring(ch2_val_im_v) & (" Actual " & to_hstring(ch2_val_im))
                SEVERITY ERROR;
            end if;
            
            if (bin /= bin_v) then
                REPORT "Error in bin: Expected " & to_hstring(bin_v) & (" Actual " & to_hstring(bin))
                SEVERITY ERROR;
            --else
                --REPORT "Well would you look at that for bin: Expected " & to_hstring(bin_v) & (" Actual " & to_hstring(bin))
                --SEVERITY NOTE;
            end if;
        END IF;
        
        IF ENDFILE(sample1_file) THEN
          report "VHDL --> Sample input file ended, restarting";
          file_status := '0';
        END IF;
        
        --IF ENDFILE(comb) THEN
          --report "VHDL --> Comb input file ended, restarting";
          --file_close(comb);
          --file_status := '0';
        --END IF;
        loop_num := loop_num + 1;
        wait for SYSCLK_PERIOD;
        
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
            sfft_DLY => x"A",
            deinterlace_DLY => (others=> '0'),
            AVG_DLY => (others=> '0'),
            weight_fold_shift => "0" & x"D",
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

end behavioral;
