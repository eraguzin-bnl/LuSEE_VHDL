library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- Assuming that one multiplicand is between 18 and 34 bits
-- And the other is between 1 and 17 bits
entity Multiply_generic17 is
generic(
  size : integer := 14
  );
  
port ( 
  i_clk      : in  std_logic;
  i_rstb     : in  std_logic;
  i_ma       : in  std_logic_vector(size - 1 downto 0);
  i_mb       : in  std_logic_vector(31 downto 0);
  o_m        : out std_logic_vector(size + 31 downto 0);
  
  valid_in   : in std_logic;
  valid_out  : out std_logic);
  
  --test_a     : in  std_logic_vector(size - 1 downto 0);
  --test_b     : in  std_logic_vector(31 downto 0);
  --test_out   : out std_logic_vector(size + 31 downto 0));
end Multiply_generic17;

architecture rtl of Multiply_generic17 is
-- (A[16:0]) x (B[34:17] x 2^17 + B[16:0]) =
-- (A[16:0] x B[31:17]) * 2^17 +
-- (A[16:0] x B[16:0])

    constant out_size    : integer := size + 32 - 1;
    signal test_out_s    : signed(out_size downto 0);
    type p_operand_hi is array(0 to 1) of signed(31-17 downto 0);
    type p_operand_in is array(0 to 1) of signed(size - 1 downto 0);
    signal p_ma_lo       : p_operand_in;
    signal p_mb_mid      : p_operand_hi;
    signal p_mb_lo       : signed(16 downto 0);

    signal r_p1          : signed(31 downto 0);  -- 14x18 => 32 bit (30 + 2 sgn bit)
    signal r_p2          : signed(28 downto 0);  -- 14x15 => 29 bit (28 + 1 sgn bit)

    signal r_m1          : signed(31 downto 0);  -- 14x18 => 32 bit (30 + 2 sgn bit)
    signal r_m2          : signed(28 downto 0);  -- 29 bits + 16 bits = 29 bits

    signal p_m1          : signed(16 downto 0);

    signal valid_s1      : std_logic;
    signal valid_s2      : std_logic;
    signal valid_s3      : std_logic;

begin
    o_m(out_size downto 17)  <= std_logic_vector(r_m2(out_size - 17 downto 0));
    o_m(16 downto 0)         <= std_logic_vector(p_m1);

    --test_out <= std_logic_vector(test_out_s);

    p_mult : process(i_clk)
    begin
        if(rising_edge(i_clk)) then
            if(i_rstb='1') then
                p_ma_lo       <= (others=>(others=>'0'));
                p_mb_mid      <= (others=>(others=>'0'));
                p_mb_lo       <= (others=>'0');

                p_m1          <= (others=>'0');

                r_m1          <= (others=>'0');
                r_m2          <= (others=>'0');
                
                r_p1          <= (others=>'0');
                r_p2          <= (others=>'0');

                valid_s1      <= '0';
                valid_s2      <= '0';
                valid_s3      <= '0';
                valid_out     <= '0';
            else
                p_ma_lo       <= signed(i_ma(size - 1 downto 0)) & p_ma_lo(0 to p_ma_lo'length-2);

                p_mb_mid      <= signed(i_mb(31 downto 17)) & p_mb_mid(0 to p_mb_mid'length-2);
                p_mb_lo       <= signed(i_mb(16 downto 0)) ;

                r_p1          <= signed(p_ma_lo(0)) * signed('0' & p_mb_lo);
                r_p2          <= signed(p_ma_lo(1)) * p_mb_mid(1);

                r_m1          <= r_p1;
                r_m2          <= r_p2 + r_m1(31 downto 17);

                p_m1          <= r_m1(16 downto 0);
                
                --test_out_s    <= signed(test_a) * signed(test_b);
                
                valid_s1      <= valid_in;
                valid_s2      <= valid_s1;
                valid_s3      <= valid_s2;
                valid_out     <= valid_s3;
            end if;
        end if;
    end process p_mult;
end rtl;
