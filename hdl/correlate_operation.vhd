--------------------------------------------------------------------------------
-- Company: Brookhaven National Laboratory
--
-- File: correlate_operation.vhd
-- File history:
--      -: 4/11/23: Initial block
--
-- Description: 
--
-- This will be a mid-level block that takes in the 4 multiplicands, assuming the conjugates have already been taken in the block above.
-- This will deal with the bit sizes and send them to a deeper block for the multiplications
-- It will then subtract the products and send the result back up
--
-- Targeted device: <Family::PolarFire> <Die::MPF300T> <Package::FCG1152>
-- Author: Eric Raguzin
--
--------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

entity correlate_operation is
generic(
  size : integer := 32;
  operation : std_logic := '0';
  signing : std_logic := '0'
  );
  
port (
    clk      : in  std_logic;
    rstb     : in  std_logic;
    m1_1       : in  std_logic_vector(31 downto 0);
    m1_2       : in  std_logic_vector(31 downto 0);
    m2_1       : in  std_logic_vector(31 downto 0);
    m2_2       : in  std_logic_vector(31 downto 0);
    index      : in  std_logic_vector(5 downto 0);
    o_m        : out std_logic_vector(31 downto 0);
    
    valid_in   : in std_logic;
    valid_out  : out std_logic;
    error      : out std_logic
);
end correlate_operation;
architecture architecture_correlate_operation of correlate_operation is
    SIGNAL product_1            : std_logic_vector(63 DOWNTO 0);
    SIGNAL product_1_signed     : signed(63 DOWNTO 0);
    SIGNAL product_1_cast       : signed(64 DOWNTO 0);
    SIGNAL product_2            : std_logic_vector(63 DOWNTO 0);
    SIGNAL product_2_signed     : signed(63 DOWNTO 0);
    SIGNAL product_2_cast       : signed(64 DOWNTO 0);
    SIGNAL result               : signed(64 DOWNTO 0);
    SIGNAL slice                : integer range 0 to 32;
    SIGNAL signed_output        : signed(31 DOWNTO 0);
    SIGNAL unsigned_output      : unsigned(31 DOWNTO 0);
    SIGNAL test      : unsigned(31 DOWNTO 0);
    SIGNAL ready_out1           : std_logic;
    SIGNAL ready_out2           : std_logic;
    SIGNAL or_out               : std_logic;
    SIGNAL or_out2              : std_logic;
    SIGNAL error_s              : std_logic;
    CONSTANT error_ones         : signed(32 downto 0) := (others=>'1');
    CONSTANT error_zeroes       : signed(32 downto 0) := (others=>'0');

begin

    mult1 : entity work.Multiply_generic32
        generic map(
            size => size)
        port map(
            -- Inputs
            i_clk => clk,
            i_rstb => rstb,
            i_ma => m1_1,
            i_mb => m1_2,

            --Valid
            valid_in => valid_in,
            valid_out => ready_out1,

            -- Outputs
            o_m => product_1
        );
    
    mult2 : entity work.Multiply_generic32
        generic map(
            size => size)
        port map(
            -- Inputs
            i_clk => clk,
            i_rstb => rstb,
            i_ma => m2_1,
            i_mb => m2_2,

            --Valid
            valid_in => valid_in,
            valid_out => ready_out2,

            -- Outputs
            o_m => product_2
        );
        
    product_1_signed <= signed(product_1);
    product_2_signed <= signed(product_2);
    
    product_1_cast <= resize(product_1_signed, 65);
    product_2_cast <= resize(product_2_signed, 65);
    
    error <= error_s;
    
    test <= unsigned(m1_1);
    
    process (clk) begin
        if (rising_edge(clk)) then
            if (rstb = '1') then
                or_out <= '0';
                or_out2 <= '0';
                valid_out <= '0';
                result <= (others=>'0');
                error_s <= '0';
                o_m <= (others=>'0');
                signed_output <= (others=>'0');
                unsigned_output <= (others=>'0');
            else
                if (operation = '0') then
                    result <= product_1_cast - product_2_cast;
                else
                    result <= product_1_cast + product_2_cast;
                end if;
                slice <= to_integer(unsigned(index));
                or_out <= ready_out1 or ready_out2;
                or_out2 <= or_out;
                valid_out <= or_out2;
                
                if (or_out = '1') then
                    -- If line below is commented, it's a sticky error flag, if not, it will reflect the output each cycle
                    error_s <= '0';
                    if (signing = '1') then
                        signed_output <= result(slice + 31 DOWNTO slice);
                        o_m <= std_logic_vector(signed_output);
                        -- Will be one cycle later than output
                        -- First check to see if number is negative
                        if (result(64) = '1') then
                            --Number is negative. Make sure that the MSB of the outputted number is negative
                            if (result(slice + 31) = '1') then
                                --If this is supposed to be a signed number, and there are any 0s higher than the slice you took off, you missed data
                                if (result(64 downto slice + 32) /= error_ones(32 downto slice)) then
                                    error_s <= '1';
                                end if;
                            else
                                error_s <= '1';
                            end if;
                        else
                            -- Same unsigned check as below
                            if (result(64 downto slice + 32) /= error_zeroes(32 downto slice)) then
                                error_s <= '1';
                            end if;
                        end if;
                    else
                        unsigned_output <= unsigned(result(slice + 31 DOWNTO slice));
                        o_m <= std_logic_vector(unsigned_output);
                        
                        -- If this is supposed to be an unsigned number, and there are any 1s higher than the slice you took off, you missed data
                        if (result(64 downto slice + 32) /= error_zeroes(32 downto slice)) then
                            error_s <= '1';
                        end if;
                    end if;
                end if;
            end if;
        end if;        
    end process;
end architecture_correlate_operation;
