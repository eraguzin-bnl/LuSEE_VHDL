library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- Assuming that the multiplicands are between 17 and 34 bits
entity Multiply_generic32 is
generic(
  size : integer := 32
  );
  
port ( 
  i_clk      : in  std_logic;
  i_rstb     : in  std_logic;
  i_ma       : in  std_logic_vector(size - 1 downto 0);
  i_mb       : in  std_logic_vector(size - 1 downto 0);
  o_m        : out std_logic_vector(size + size - 1 downto 0);
  
  valid_in   : in std_logic;
  valid_out  : out std_logic);
  
  --test_a     : in  std_logic_vector(size - 1 downto 0);
  --test_b     : in  std_logic_vector(size - 1 downto 0);
  --test_out   : out std_logic_vector(size + size - 1 downto 0));
end Multiply_generic32;

architecture rtl of Multiply_generic32 is
-- (A[34:17] x 2^17 + A[16:0]) x (B[34:17] x 2^17 + B[16:0]) =
-- (A[33:17] x B[33:17] * 2^34 +
-- (A[16:0] x B[31:17] + A[33:17] x B[16:0]) * 2^17 +
-- (A[16:0] x B[16:0])

    function larger(i0:integer; i1:integer) 
        return integer is
        begin
            if (i0 > i1) then
                return i0;
            else
                return i1;
            end if;
        end function;
    
    constant out_size    : integer := size + size - 1;
    constant remaining   : integer := size - 17;
    constant remaining2  : integer := (2 * remaining) - 1;
    constant high_size   : integer := larger(remaining2, 18);
    signal test_out_s    : signed(out_size downto 0);
    type p_operand_17 is array(0 to 3) of signed(16 downto 0);
    type p_operand_hi is array(0 to 3) of signed(remaining - 1 downto 0);
    signal p_ma_mid      : p_operand_hi;
    signal p_ma_lo       : p_operand_17;
    signal p_mb_mid      : p_operand_hi;
    signal p_mb_lo       : p_operand_17;

    signal r_p1          : signed(35 downto 0);  -- 18x18 => 36 bit (34 + 2 sgn bit)
    signal r_p2          : signed(size downto 0);  -- 18x remaining_b => sum of sizes + 1 sgn bit
    signal r_p3          : signed(size downto 0);  -- 18x remaining_a => sum of sizes + 1 sgn bit
    signal r_p4          : signed(remaining2 downto 0);  -- remaining_a x remaining_b  => remaining_a + remaining_b no sgn bit

    signal r_m1          : signed(35 downto 0);  -- 18x18 => 36 bit (34 + 2 sgn bit)
    signal r_m2          : signed(size downto 0);  -- (18x remaining_b => sum of sizes + 1 sgn bit) + 18 bits
    signal r_m3          : signed(size downto 0);  -- addition between a_size and b_size
    signal r_m4          : signed(high_size downto 0);  -- addition between a_size and b_size + 18 bits

    signal p_m1          : p_operand_17;  -- delay compensation
    signal p_m3          : signed(16 downto 0);  -- delay compensation

    signal valid_s1      : std_logic;
    signal valid_s2      : std_logic;
    signal valid_s3      : std_logic;
    signal valid_s4      : std_logic;
    signal valid_s5      : std_logic;

begin

    o_m(out_size downto 34)  <= std_logic_vector(r_m4(out_size - 34 downto 0));
    o_m(33 downto 17)        <= std_logic_vector(p_m3);
    o_m(16 downto 0)        <= std_logic_vector(p_m1(2));

    --test_out <= std_logic_vector(test_out_s);

    p_mult : process(i_clk)
    begin
        if(rising_edge(i_clk)) then
            if(i_rstb='1') then
                p_ma_mid      <= (others=>(others=>'0'));
                p_ma_lo       <= (others=>(others=>'0'));
                p_mb_mid      <= (others=>(others=>'0'));
                p_mb_lo       <= (others=>(others=>'0'));

                p_m1          <= (others=>(others=>'0'));
                p_m3          <= (others=>'0');

                r_p1          <= (others=>'0');
                r_p2          <= (others=>'0');
                r_p3          <= (others=>'0');
                r_p4          <= (others=>'0');
                
                r_m1          <= (others=>'0');
                r_m2          <= (others=>'0');
                r_m3          <= (others=>'0');
                r_m4          <= (others=>'0');

                valid_s1      <= '0';
                valid_s2      <= '0';
                valid_s3      <= '0';
                valid_s4      <= '0';
                valid_s5      <= '0';
                valid_out     <= '0';
            else
                p_ma_mid      <= signed(i_ma(size - 1 downto 17)) & p_ma_mid(0 to p_ma_mid'length-2);
                p_ma_lo       <= signed(i_ma(16 downto 0)) & p_ma_lo(0 to p_ma_lo'length-2);

                p_mb_mid      <= signed(i_mb(size - 1 downto 17)) & p_mb_mid(0 to p_mb_mid'length-2);
                p_mb_lo       <= signed(i_mb(16 downto 0)) & p_mb_lo(0 to p_mb_lo'length-2);

                r_p1          <= signed('0' & p_ma_lo(0)) * signed('0' & p_mb_lo(0));
                r_p2          <= signed('0' & p_ma_lo(1)) * p_mb_mid(1);
                r_p3          <= p_ma_mid(2) * signed('0' & p_mb_lo(2));
                r_p4          <= p_ma_mid(3) * p_mb_mid(3);

                r_m1          <= r_p1;
                r_m2          <= r_p2 + r_m1(34 downto 17);
                r_m3          <= r_p3 + r_m2;
                r_m4          <= r_p4 + r_m3(size downto 17);

                p_m1          <= r_m1(16 downto 0) & p_m1(0 to p_m1'length-2);
                p_m3          <= r_m3(16 downto 0);
                
                --test_out_s    <= signed(test_a) * signed(test_b);
                
                valid_s1      <= valid_in;
                valid_s2      <= valid_s1;
                valid_s3      <= valid_s2;
                valid_s4      <= valid_s3;
                valid_s5      <= valid_s4;
                valid_out     <= valid_s5;
            end if;
        end if;
    end process p_mult;

end rtl;
