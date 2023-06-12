--------------------------------------------------------------------------------
-- Company: Brookhaven National Laboratory
--
-- File: correlate_operation.vhd
-- File history:
--      -: 4/11/23: Initial block
--
-- Description: 
--
-- This is a mid-level block that takes in the 4 multiplicands, assuming the conjugates have already been accounted for in the block above.
-- This will deal with the bit sizes and send them to a deeper block for the multiplications
-- It will then add/subtract the products and send the result back up
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
  operation : std_logic := '0'
  );
  
port (
    clk      : in  std_logic;
    rstb     : in  std_logic;
    m1_1       : in  std_logic_vector(31 downto 0);
    m1_2       : in  std_logic_vector(31 downto 0);
    m2_1       : in  std_logic_vector(31 downto 0);
    m2_2       : in  std_logic_vector(31 downto 0);
    index      : in  std_logic_vector(4 downto 0);
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
    SIGNAL slice                : integer range 0 to 33;
    SIGNAL ready_out1           : std_logic;
    SIGNAL ready_out2           : std_logic;
    SIGNAL or_out               : std_logic;
    SIGNAL error_s              : std_logic;
    CONSTANT error_ones         : signed(64 downto 0) := (others=>'1');
    CONSTANT error_zeroes       : signed(64 downto 0) := (others=>'0');

begin
    --Custom made 32 x 32 bit pipelined multipliers
    --Valid out matches when o_m is valid
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
        
    --Products are turned to signed values and resized
    --Because they may be added (account for carry bit)
    product_1_signed <= signed(product_1);
    product_2_signed <= signed(product_2);
    
    product_1_cast   <= resize(product_1_signed, 65);
    product_2_cast   <= resize(product_2_signed, 65);
    
    error            <= error_s;
    
    process (clk) 
        variable result_shifted : signed(64 DOWNTO 0) := (others=>'0');
        variable test_slice     : signed(64 DOWNTO 0) := (others=>'0');
        begin
        if (rising_edge(clk)) then
            if (rstb = '1') then
                or_out           <= '0';
                valid_out        <= '0';
                result           <= (others=>'0');
                error_s          <= '0';
                o_m              <= (others=>'0');
                result_shifted   := (others=>'0');
                test_slice       := (others=>'0');
            else
                --In accordance with the math behind the correlation, we can either choose to add or subtract these products:
                --https://docs.google.com/document/d/1Lwyd6R5K137iAEkU46W6g1r_I-K36TcrstWcGuUA1Do/edit
                if (operation = '0') then
                    result       <= product_1_cast - product_2_cast;
                else
                    result       <= product_1_cast + product_2_cast;
                end if;
                
                --This value is how many bits to shift the result right by
                --The result could potentially be 65 bits long and we need to return a 32 bit value
                --If the value truly does use the full size, then we want to shift it 33 bits to keep the MSBs
                --If the MSB of the value is in bit 18, we can just take the lower 32 bits
                --It's up to the user or microcontroller to monitor the output and decide
                slice <= to_integer(unsigned(index));
                if (or_out = '1') then
                    -- If line below is commented, it's a sticky error flag, if not, it will reflect the output each cycle
                    --error_s <= '0';
                    result_shifted := shift_right(result, slice);
                    o_m <= std_logic_vector(result_shifted(31 DOWNTO 0));
                    
                    --Checks to make an error flag that will show if we didn't shift enough and left some MSBs with value leftoever
                    test_slice := shift_right(result, slice + 31);
                    -- Will be one cycle later than output
                    -- First check to see if number is negative
                    if (test_slice(64) = '1') then
                        --This is a signed negative number, if there are any 0s higher than the slice you took off, you missed data
                        if (test_slice < error_ones) then
                            error_s <= '1';
                        end if;
                    else
                        --This is a signed positive number, if there are any 1s higher than the slice you took off, you missed data
                        if (test_slice > error_zeroes) then
                            error_s <= '1';
                        end if;
                    end if;
                end if;
                
                --Pipelined valid flag output
                or_out <= ready_out1 or ready_out2;
                valid_out <= or_out;
            end if;
        end if;        
    end process;
end architecture_correlate_operation;
