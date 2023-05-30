library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Multiply_generic is
generic(
  a_size : integer := 42
  );
  
port ( 
  i_clk      : in  std_logic;
  i_rstb     : in  std_logic;
  i_ma       : in  std_logic_vector(a_size downto 0);
  i_mb       : in  std_logic_vector(31 downto 0);
  o_m        : out std_logic_vector(a_size + 31 + 1 downto 0);
  
  valid_in   : in std_logic;
  valid_out  : out std_logic);
  
  --test_a     : in  std_logic_vector(a_size downto 0);
  --test_b     : in  std_logic_vector(31 downto 0);
  --test_out   : out std_logic_vector(a_size + 31 + 1 downto 0));
end Multiply_generic;

architecture rtl of Multiply_generic is
-- (A[42:34] x 2^34 + A[33:17] x 2^17 + A[16:0]) x (B[31:17] x 2^17 + B[16:0]) =
-- (A[42:34] x B[31:17]) x 2^51 +
-- (A[33:17] x B[31:17] + A[42:34] x B[16:0]) * 2^34 +
-- (A[16:0] x B[31:17] + A[33:17] x B[16:0]) * 2^17 +
-- (A[16:0] x B[16:0])
    constant out_size    : integer := a_size + 31 + 1;
    constant remaining   : integer := a_size - 34;
    --signal test_out_s    : signed(out_size downto 0);
    type p_operand_17 is array(0 to 4) of signed(16 downto 0);
    type p_operand_15 is array(0 to 5) of signed(14 downto 0);
    type p_operand_x is array(0 to 5) of signed(remaining downto 0);
    signal p_ma_hi       : p_operand_x;
    signal p_ma_mid      : p_operand_17;
    signal p_ma_lo       : p_operand_17;
    signal p_mb_mid      : p_operand_15;
    signal p_mb_lo       : p_operand_17;

    signal r_p1          : signed(35 downto 0);  -- 18x18 => 36 bit (34 + 2 sgn bit)
    signal r_p2          : signed(32 downto 0);  -- 18x15 => 33 bit (32 + 1 sgn bit)
    signal r_p3          : signed(35 downto 0);  -- 18x18 => 36 bit (34 + 2 sgn bit)
    signal r_p4          : signed(18 + remaining downto 0);  -- 9x18  => 27 bit (26 + 1 sgn bit)
    signal r_p5          : signed(32 downto 0);  -- 18x15 => 33 bit (32 + 1 sgn bit)
    signal r_p6          : signed(15 + remaining downto 0);  -- 9x15  => 24 bit (24 + 0 sgn bit)

    signal r_m1          : signed(35 downto 0);  -- 18x18 => 36 bit (34 + 2 sgn bit)
    signal r_m2          : signed(32 downto 0);  -- 18x15 => 33 bit (32 + 1 sgn bit) + 19 bit number
    signal r_m3          : signed(35 downto 0);  -- 18x18 => 36 bit (35 + 1 sgn bit) + 33 bit number
    signal r_m4          : signed(18 + remaining downto 0);  -- 9x18  => 27 bit (26 + 1 sgn bit) + 19 bit number
    signal r_m5          : signed(32 downto 0);  -- 18x15 => 33 bit (32 + 1 sgn bit) + 27 bit number
    signal r_m6          : signed(15 + remaining downto 0);  -- 9x15  => 24 bit (24 + 0 sgn bit) + 16 bit number

    signal p_m1          : p_operand_17;  -- delay compensation
    signal p_m3          : p_operand_17;  -- delay compensation
    signal p_m5          : p_operand_17;  -- delay compensation

    signal valid_s1      : std_logic;
    signal valid_s2      : std_logic;
    signal valid_s3      : std_logic;
    signal valid_s4      : std_logic;
    signal valid_s5      : std_logic;
    signal valid_s6      : std_logic;
    signal valid_s7      : std_logic;
    signal valid_s8      : std_logic;

begin

    o_m(out_size downto 51)  <= std_logic_vector(r_m6(15 + remaining downto 0));
    o_m(50 downto 34)        <= std_logic_vector(p_m5(0));
    o_m(33 downto 17)        <= std_logic_vector(p_m3(2));
    o_m(16 downto 0)        <= std_logic_vector(p_m1(4));

    --test_out <= std_logic_vector(test_out_s);

    p_mult : process(i_clk)
    begin
        if(rising_edge(i_clk)) then
            if(i_rstb='1') then
                p_ma_hi       <= (others=>(others=>'0'));
                p_ma_mid      <= (others=>(others=>'0'));
                p_ma_lo       <= (others=>(others=>'0'));
                p_mb_mid      <= (others=>(others=>'0'));
                p_mb_lo       <= (others=>(others=>'0'));
                
                p_m1          <= (others=>(others=>'0'));
                p_m3          <= (others=>(others=>'0'));
                p_m5          <= (others=>(others=>'0'));

                r_p1          <= (others=>'0');
                r_p2          <= (others=>'0');
                r_p3          <= (others=>'0');
                r_p4          <= (others=>'0');
                r_p5          <= (others=>'0');
                r_p6          <= (others=>'0');
                
                r_m1          <= (others=>'0');
                r_m2          <= (others=>'0');
                r_m3          <= (others=>'0');
                r_m4          <= (others=>'0');
                r_m5          <= (others=>'0');
                r_m6          <= (others=>'0');
                
                valid_s1      <= '0';
                valid_s2      <= '0';
                valid_s3      <= '0';
                valid_s4      <= '0';
                valid_s5      <= '0';
                valid_s6      <= '0';
                valid_s7      <= '0';
                valid_out     <= '0';
        
            else
                p_ma_hi       <= signed(i_ma(a_size downto 34)) & p_ma_hi(0 to p_ma_hi'length-2);
                p_ma_mid      <= signed(i_ma(33 downto 17)) & p_ma_mid(0 to p_ma_mid'length-2);
                p_ma_lo       <= signed(i_ma(16 downto 0)) & p_ma_lo(0 to p_ma_lo'length-2);

                p_mb_mid      <= signed(i_mb(31 downto 17)) & p_mb_mid(0 to p_mb_mid'length-2);
                p_mb_lo       <= signed(i_mb(16 downto 0)) & p_mb_lo(0 to p_mb_lo'length-2);

                r_p1          <= signed('0' & p_ma_lo(0)) * signed('0' & p_mb_lo(0));
                r_p2          <= signed('0' & p_ma_lo(1)) * p_mb_mid(1);
                r_p3          <= signed('0' & p_ma_mid(2)) * signed('0' & p_mb_lo(2));
                r_p4          <= p_ma_hi(3) * signed('0' & p_mb_lo(3));
                r_p5          <= signed('0' & p_ma_mid(4)) * p_mb_mid(4);
                r_p6          <= p_ma_hi(5) * p_mb_mid(5);

                r_m1          <= r_p1;
                r_m2          <= r_p2 + r_m1(35 downto 17);
                r_m3          <= r_p3 + r_m2;
                r_m4          <= r_p4 + r_m3(35 downto 17);
                r_m5          <= r_p5 + r_m4;
                r_m6          <= r_p6 + r_m5(32 downto 17);

                p_m1          <= r_m1(16 downto 0) & p_m1(0 to p_m1'length-2);
                p_m3          <= r_m3(16 downto 0) & p_m3(0 to p_m3'length-2);
                p_m5          <= r_m5(16 downto 0) & p_m5(0 to p_m5'length-2);
                
                --test_out_s    <= signed(test_a) * signed(test_b);
                
                valid_s1      <= valid_in;
                valid_s2      <= valid_s1;
                valid_s3      <= valid_s2;
                valid_s4      <= valid_s3;
                valid_s5      <= valid_s4;
                valid_s6      <= valid_s5;
                valid_s7      <= valid_s6;
                valid_out     <= valid_s7;
            end if;
        end if;
    end process p_mult;

end rtl;