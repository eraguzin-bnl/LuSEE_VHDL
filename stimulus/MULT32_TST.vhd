----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Wed Mar 23 20:02:50 2023
-- Testbench Template
-- This is a basic testbench that instantiates your design with basic 
-- clock and reset pins connected.  If your design has special
-- clock/reset or testbench driver requirements then you should 
-- copy this file and modify it. 
----------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: MULT32_TST.vhd
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
USE IEEE.std_logic_textio.ALL;

entity MULT32_TST is
end MULT32_TST;

architecture behavioral of MULT32_TST is

    constant SYSCLK_PERIOD : time := 100 ns; -- 10MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';
    
    signal ready     : std_logic := '0';
    
    SIGNAL fft_delay_s                          :      std_logic;
    
    SIGNAL ch1_val_re                        :      std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
    SIGNAL ch1_val_im                        :      std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
    SIGNAL ch2_val_re                        :      std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
    SIGNAL ch2_val_im                        :      std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
    
    SIGNAL output                            :      std_logic_vector(63 DOWNTO 0);  -- sfix32_En7
    SIGNAL output_test                       :      std_logic_vector(63 DOWNTO 0);  -- sfix32_En7
    SIGNAL output_test_s1                    :      std_logic_vector(63 DOWNTO 0);  -- sfix32_En7
    SIGNAL output_test_s2                    :      std_logic_vector(63 DOWNTO 0);  -- sfix32_En7
    SIGNAL output_test_s3                    :      std_logic_vector(63 DOWNTO 0);  -- sfix32_En7
    SIGNAL output_test_s4                    :      std_logic_vector(63 DOWNTO 0);  -- sfix32_En7
    SIGNAL output_test_s5                    :      std_logic_vector(63 DOWNTO 0);  -- sfix32_En7
    SIGNAL output_test_s6                    :      std_logic_vector(63 DOWNTO 0);  -- sfix32_En7
    SIGNAL output_test_s7                    :      std_logic_vector(63 DOWNTO 0);  -- sfix32_En7

  FUNCTION to_hex(x : IN std_logic_vector) RETURN string IS
    VARIABLE result : STRING(1 TO 256);
    VARIABLE i      : INTEGER;
    VARIABLE imod   : INTEGER;
    VARIABLE j      : INTEGER;
    VARIABLE jinc   : INTEGER;
    VARIABLE newx   : std_logic_vector(1023 DOWNTO 0);
  BEGIN
    newx := (OTHERS => '0');
    IF x'LEFT > x'RIGHT THEN
      j := x'LENGTH - 1;
      jinc := -1;
    ELSE
      j := 0;
      jinc := 1;
    END IF;
    FOR i IN x'RANGE LOOP
      newx(j) := x(i);
      j := j + jinc;
    END LOOP;
    i := x'LENGTH - 1;
    imod := x'LENGTH MOD 4;
    IF    imod = 1 THEN i := i + 3;
    ELSIF imod = 2 THEN i := i + 2;
    ELSIF imod = 3 THEN i := i + 1;
    END IF;
    j := 1;
    WHILE i >= 3 LOOP
      IF    newx(i DOWNTO (i-3)) = "0000" THEN result(j) := '0';
      ELSIF newx(i DOWNTO (i-3)) = "0001" THEN result(j) := '1';
      ELSIF newx(i DOWNTO (i-3)) = "0010" THEN result(j) := '2';
      ELSIF newx(i DOWNTO (i-3)) = "0011" THEN result(j) := '3';
      ELSIF newx(i DOWNTO (i-3)) = "0100" THEN result(j) := '4';
      ELSIF newx(i DOWNTO (i-3)) = "0101" THEN result(j) := '5';
      ELSIF newx(i DOWNTO (i-3)) = "0110" THEN result(j) := '6';
      ELSIF newx(i DOWNTO (i-3)) = "0111" THEN result(j) := '7';
      ELSIF newx(i DOWNTO (i-3)) = "1000" THEN result(j) := '8';
      ELSIF newx(i DOWNTO (i-3)) = "1001" THEN result(j) := '9';
      ELSIF newx(i DOWNTO (i-3)) = "1010" THEN result(j) := 'A';
      ELSIF newx(i DOWNTO (i-3)) = "1011" THEN result(j) := 'B';
      ELSIF newx(i DOWNTO (i-3)) = "1100" THEN result(j) := 'C';
      ELSIF newx(i DOWNTO (i-3)) = "1101" THEN result(j) := 'D';
      ELSIF newx(i DOWNTO (i-3)) = "1110" THEN result(j) := 'E';
      ELSIF newx(i DOWNTO (i-3)) = "1111" THEN result(j) := 'F';
      ELSE result(j) := 'X';
      END IF;
      i := i - 4;
      j := j + 1;
    END LOOP;
    RETURN result(1 TO j - 1);
  END;
    
    FUNCTION to_hex(x : IN std_logic) RETURN string IS
    BEGIN
    RETURN std_logic'image(x);
    END;

    FUNCTION to_hex(x : IN signed) RETURN string IS
    BEGIN
    RETURN to_hex(std_logic_vector(x));
    END;

    FUNCTION to_hex(x : IN unsigned) RETURN string IS
    BEGIN
    RETURN to_hex(std_logic_vector(x));
    END;

    FUNCTION to_hex(x : IN real) RETURN string IS
    BEGIN
    RETURN real'image(x);
    END;
    
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

    -- Data source for adc
      c_re_fileread: PROCESS
        FILE fp: TEXT;
        VARIABLE file_status: std_logic := '0';
        VARIABLE l: LINE;
        VARIABLE read_data: std_logic_vector(63 DOWNTO 0);
        VARIABLE ch1_val_re_v: std_logic_vector(31 DOWNTO 0);
        VARIABLE ch1_val_im_v: std_logic_vector(31 DOWNTO 0);
        VARIABLE ch2_val_re_v: std_logic_vector(31 DOWNTO 0);
        VARIABLE ch2_val_im_v: std_logic_vector(31 DOWNTO 0);

      BEGIN
      wait for SYSCLK_PERIOD;
        IF (file_status = '0') THEN
            --report "Opening file";
            file_open(fp, "mult_data.txt", read_mode);
            file_status := '1';
        END IF;
        
        IF NSYSRESET = '0' AND NOT ENDFILE(fp) THEN
        --report "reading line ";
            ready <= '1';
          READLINE(fp, l);
          HREAD(l, read_data);
          ch1_val_re_v := read_data(63 downto 32);
          ch1_val_im_v := read_data(31 downto 0);
          ch1_val_re <= ch1_val_re_v;
          ch1_val_im <= ch1_val_im_v;
          ch2_val_re <= ch1_val_re_v;
          ch2_val_im <= ch1_val_im_v;
          --report "value is " & to_hex_string(read_data);
          --report "sample1v is " & to_hex_string(sample1_v);
          --report "sample2v is " & to_hex_string(sample2_v);
        END IF;
        
        IF ENDFILE(fp) THEN
          --report "VHDL --> Sample input file ended, restarting";
          file_close(fp);
          file_status := '0';
        END IF;
        
        output_test_s1 <= output_test;
        output_test_s2 <= output_test_s1;
        output_test_s3 <= output_test_s2;
        output_test_s4 <= output_test_s3;
        output_test_s5 <= output_test_s4;
        output_test_s6 <= output_test_s5;
        output_test_s7 <= output_test_s6;
        
        if (fft_delay_s = '1') then
            if (output_test_s5 /= output) then
                REPORT "Error in multiplication: Expected " & to_hex(output_test_s6) & (" Actual " & to_hex(output))
                SEVERITY ERROR;
            end if;
        end if;
        
      END PROCESS c_re_fileread;

    ch1im_x_conj_ch1im : entity work.Multiply_generic32
        generic map(
            size => 32)
        port map(
            -- Inputs
            i_clk => SYSCLK,
            i_rstb => NSYSRESET,
            i_ma => ch1_val_re,
            i_mb => ch1_val_im,

            --Valid
            valid_in => ready,
            valid_out => fft_delay_s,

            -- Outputs
            o_m => output
            
            --test_a => ch1_val_re,
            --test_b => ch1_val_im,
            --test_out => output_test
        );

end behavioral;
