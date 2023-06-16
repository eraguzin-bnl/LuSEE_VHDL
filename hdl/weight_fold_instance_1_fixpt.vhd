-- -------------------------------------------------------------
--
-- Module: weight_fold_instance_1_fixpt
-- Source Path: weight_fold_instance_1_fixpt
-- Hierarchy Level: 0
-- Functionality originally generated from Matlab
-- Redesigned by Eric Raguzin
-- June 2023
-- This block takes in the raw ADC sample as well as 4 weights
-- The 4 weights are offset positions along the Sinc function for the polyphase filter
-- In effect, the sample stream gets saved into RAM blocks
-- The first 4096 samples in the first RAM block, the next 4096 in the next RAM block, etc..., then it loops around
-- As the weights come in, w1 is multiplied by the first sample 1 in RAM block 1,
-- w2 is multiplied by sample 4097 in RAM block 2 (which is index 1 there), etc...
-- All 4 of the multiplications are added together and outputted from this block
-- The ce_out flag acts as a data valid flag to tell the next block the data is good
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.spectrometer_fixpt_pkg.ALL;

ENTITY weight_fold_instance_1_fixpt IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        reset_RAM                         :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        sample_1                          :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14
        w1                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
        w2                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
        w3                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
        w4                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
        val_division                      :   IN    std_logic_vector(4 DOWNTO 0);
        ce_out                            :   OUT   std_logic;
        val_out                           :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En18
        );
END weight_fold_instance_1_fixpt;


ARCHITECTURE rtl OF weight_fold_instance_1_fixpt IS

  -- Component Declarations
  component PF_TPSRAM_WEIGHT_FOLD
    PORT (
        CLK                               :   IN    std_logic;
        R_ADDR                            :   IN    std_logic_vector(11 downto 0);
        W_EN                              :   IN    std_logic;
        W_ADDR                            :   IN    std_logic_vector(11 downto 0);
        W_DATA                            :   IN    signed(13 downto 0);
        R_DATA                            :   OUT   signed(13 downto 0)
        );
    end component;

    -- Signals
    signal write_en                       : std_logic_vector(3 downto 0);
    signal write_data                     : signed(13 downto 0);
    signal write_address                  : std_logic_vector(11 downto 0);
    signal read_data                      : vector_of_signed14(3 downto 0);
    signal read_data_s1                   : vector_of_signed14(3 downto 0);
    signal read_data_s2                   : vector_of_signed14(3 downto 0);
    signal read_data_s3                   : vector_of_signed14(3 downto 0);

    signal ndx                            : integer range 0 to 4095;
    signal bndx                           : integer range 0 to 3;
    signal bndx_s1                        : integer range 0 to 3;
    signal bndx_s2                        : integer range 0 to 3;
    signal RAM_full                       : std_logic;
    signal RAM_full_s1                    : std_logic;
    signal RAM_full_s2                    : std_logic;

    signal weights_s1                     : vector_of_std_logic_vector32(3 downto 0);
    signal weights_s2                     : vector_of_std_logic_vector32(3 downto 0);
    signal weights_s3                     : vector_of_std_logic_vector32(3 downto 0);
    signal weight_fold_raw                : vector_of_std_logic_vector46(3 downto 0);
    signal weight_fold_trim               : vector_of_signed48(3 downto 0);
    signal val_full                       : signed(47 downto 0);
    signal shift_num                      : integer range 0 to 31;

    signal valid_in                       : std_logic_vector(3 downto 0);
    signal valid_in_s1                    : std_logic_vector(3 downto 0);
    signal valid_in_s2                    : std_logic_vector(3 downto 0);
    signal valid_out                      : std_logic_vector(3 downto 0);

    signal block_valid_s1                 : std_logic;
    signal block_valid_s2                 : std_logic;
    signal block_valid_s3                 : std_logic;

    signal reset_RAM_s1                   : std_logic;
    signal reset_RAM_s2                   : std_logic;
    signal reset_counter                  : integer range 0 to 4095;

    type state_type is (
        RESET_IDLE,
        RESET_GO
        );
    signal state: state_type;

    BEGIN
    --RAM blocks which save the samples in 4096 cycle periods
    --RAM blocks have IP core-level pipelining enabled
    --Once read address is clocked in, the data doesn't come out the next clock, it's the one after that
    generate_ram: for ii in 0 to 3 generate
        RAM : PF_TPSRAM_WEIGHT_FOLD
        PORT MAP(
            CLK       => clk,
            R_ADDR    => std_logic_vector(to_unsigned(ndx, write_address'length)),
            W_EN      => write_en(ii),
            W_ADDR    => write_address,
            W_DATA    => write_data,
            R_DATA    => read_data(ii)
        );
    end generate generate_ram;

    --Pipelined multipliers for the 32 bit x 14 bit multiplication
    --Inputs and outputs are matched with pipelined data to account for block architecture
    --If valid_in is high when the first valid inputs are presented
    --valid_out should go high for the first valid data output
    generate_mult: for ii in 0 to 3 generate
        mult : entity work.Multiply_generic17
        generic map(
            size => 14)
        port map(
            -- Inputs
            i_clk     => clk,
            i_rstb    => reset,
            i_ma      => std_logic_vector(read_data_s3(ii)),
            i_mb      => weights_s3(ii),

            --Valid
            valid_in  => valid_in_s2(ii),
            valid_out => valid_out(ii),

            -- Outputs
            o_m       => weight_fold_raw(ii)
        );
    end generate generate_mult;

    process (clk)
    begin
    if (rising_edge(clk)) then
        reset_RAM_s1 <= reset_RAM;
        reset_RAM_s2 <= reset_RAM_s1;
        if (reset = '1') then
            ndx                  <= 0;
            bndx                 <= 0;
            bndx_s1              <= 0;
            bndx_s2              <= 0;
            write_en             <= "0000";
            write_address        <= (others=>'0');
            write_data           <= (others=>'0');
            read_data_s1         <= (others=>(others=>'0'));
            read_data_s2         <= (others=>(others=>'0'));
            read_data_s3         <= (others=>(others=>'0'));
            weights_s1           <= (others=>(others=>'0'));
            weights_s2           <= (others=>(others=>'0'));
            weights_s3           <= (others=>(others=>'0'));
            valid_in             <= (others=>'0');
            valid_in_s1          <= (others=>'0');
            valid_in_s2          <= (others=>'0');
            block_valid_s1       <= '0';
            block_valid_s2       <= '0';
            block_valid_s3       <= '0';
            weight_fold_trim     <= (others=>(others=>'0'));
            val_full             <= (others=>'0');
            val_out              <= (others=>'0');
            shift_num            <= 0;
            ce_out               <= '0';
            RAM_full             <= '0';
            RAM_full_s1          <= '0';
            RAM_full_s2          <= '0';
            reset_counter        <= 0;
            state                <= RESET_IDLE;

            --If a reset RAM signal comes through, go through the loop, writing every
            --Address from 0 to 4095 to 0
            CASE state IS
            when RESET_IDLE =>
                if (reset_RAM_s2 = '0' and reset_RAM_s1 = '1') then
                    state         <= RESET_GO;
                    write_en      <= "1111";
                end if;
            when RESET_GO =>
                write_en          <= "1111";
                write_address     <= std_logic_vector(to_unsigned(reset_counter, write_address'length));
                if (reset_counter = 4095) then
                    state         <= RESET_IDLE;
                    reset_counter <= 0;
                else
                    reset_counter     <= reset_counter + 1;
                    state         <= RESET_GO;
                end if;
            when others =>
                state             <= RESET_IDLE;
            end case;

        else
            --bndx gives which quarter of the full sample length is active and should be written
            --When a sample comes in, the newest index of the active quadrant is multiplied directly
            --And the other 3 have their samples come from the RAM blocks
            --ndx is the index within each quadrant of data
            if (ndx = 4095) then
                ndx <= 0;
                if (bndx = 3) then
                    bndx <= 0;
                    RAM_full <= '1';
                else
                    bndx <= bndx + 1;
                end if;
            else
                ndx <= ndx + 1;
            end if;
            
            --Since weights get written into ram with ndx, and ndx also determined the read out address,
            --weight need to be delayed so they can sync up for multiplication
            --Originally tried to have a read pointer that was always 2 indexes ahead of the write pointer
            --Was fine initially when all RAM blocks are 0s. But when you reset the block without resetting the RAM
            --(such as a potential interlacing feature which me may implement), you want to get the actual value of index 0
            --So two extra pipelined clock cycles for full coverage and starting from index 0 every time
            weights_s1(0) <= w1;
            weights_s1(1) <= w2;
            weights_s1(2) <= w3;
            weights_s1(3) <= w4;
            weights_s2    <= weights_s1;
            weights_s3    <= weights_s2;

            --Only want to start carrying the valid flag through if all 4 RAM quadrants have filled up with samples
            --Or else the PFB data is invalid. Without this, we would just ignore the first batch
            --Need to wait two extra cycles because of RAM block pipelining
            RAM_full_s1 <= RAM_full;
            RAM_full_s2 <= RAM_full_s1;
            if (RAM_full_s2 = '1') then
                valid_in_s2      <= (others=>'1');
            else
                valid_in_s2      <= (others=>'0');
            end if;
            --valid_in_s1   <= valid_in;
            --valid_in_s2   <= valid_in_s1;

            --Because of pipelining, decisions about which RAM to write to need to be decided with the current bndx
            --And decisions about what quadrant the RAM read data came from need to be made on a 2 clock delay
            bndx_s1 <= bndx;
            bndx_s2 <= bndx_s1;

            --Now this is tricky to visualize without a waveform viewer
            --read_data is the output of the RAM block 2 cycles after the index requested it
            --Based on the delayed bndx from when that value was requested, 3 of the quadrants will take that
            --outputted value and skip 2 pipelines to write it directly to read_data_s3.
            --So that means next clock, those 3 quadrants' data will have a total of 3 clock delays,
            --Matching up perfectly with the weights_s3 that was delayed 3 clock cycles and on the first cycle after a reset,
            --the first valid_in to tell the multiplier the incoming data is ready to multiply
            read_data_s1 <= read_data;
            read_data_s2 <= read_data_s1;
            read_data_s3 <= read_data_s2;

            --However, one of those quadrants should be the latest sample instead of the stored value.
            --2 clock cycles ago, when the RAM read address was requesting the values that are now read_data
            --The actual sample value was getting pipelined twice so it will match up directly with read_data_s3
            --So that the value for all 4 quadrants is synced as it goes into the multipliers
            --The case statement changes which quadrant is the odd one out as the counter increases

            case bndx_s2 is
                when 0 =>
                    read_data_s1(0) <= signed(sample_1);
                    read_data_s3(1) <= read_data(1);
                    read_data_s3(2) <= read_data(2);
                    read_data_s3(3) <= read_data(3);
                when 1 =>
                    read_data_s1(1) <= signed(sample_1);
                    read_data_s3(0) <= read_data(0);
                    read_data_s3(2) <= read_data(2);
                    read_data_s3(3) <= read_data(3);
                when 2 =>
                    read_data_s1(2) <= signed(sample_1);
                    read_data_s3(0) <= read_data(0);
                    read_data_s3(1) <= read_data(1);
                    read_data_s3(3) <= read_data(3);
                when 3 =>
                    read_data_s1(3) <= signed(sample_1);
                    read_data_s3(0) <= read_data(0);
                    read_data_s3(1) <= read_data(1);
                    read_data_s3(2) <= read_data(2);
                when others =>
                    read_data_s1(0) <= signed(sample_1);
                    read_data_s3(1) <= read_data(1);
                    read_data_s3(2) <= read_data(2);
                    read_data_s3(3) <= read_data(3);
            end case;

            --Because it takes one clock cycle to decide which RAM's write_en will be high
            --The other write parameters need to be pipelined one cycle
            --And that write decision is made by the current bndx value according to the indexing loop
            --Also, when bndx changes from 0 to 1, you still want bndx_s2 to be doing the above case statement
            --Based on bndx = 0 (writing read_data_s1(0) <= signed(sample_1)) for two more clock cycles in the case statement above
            --But you want read_data_s1(1) <= signed(sample_1), the #1 index of read_data_s1 to be taking the latest sample values
            --In order to start it pipeling through read_data_s2, etc... So it's immediately correct when bndx_s2 is 1
            write_data <= signed(sample_1);
            write_address <= std_logic_vector(to_unsigned(ndx, write_address'length));

            case bndx is
                when 0 =>
                    write_en <= "0001";
                    read_data_s1(0) <= signed(sample_1);
                when 1 =>
                    write_en <= "0010";
                    read_data_s1(1) <= signed(sample_1);
                when 2 =>
                    write_en <= "0100";
                    read_data_s1(2) <= signed(sample_1);
                when 3 =>
                    write_en <= "1000";
                    read_data_s1(3) <= signed(sample_1);
                when others =>
                    write_en <= "0000";
                    read_data_s1(0) <= signed(sample_1);
            end case;

            --Once the multipliers all have valid outputs (this should happen at the same time)
            --We finally have a stream of values that is already synchronized in time and we don't have to do pipelining with
            --We just need to add the products and output. These pipelining states are done to minimize any timing issues

            if (valid_out = "1111") then
                block_valid_s1 <= '1';
                --Adds 2 bits to account for potential overflow in addition of 4 addends
                weight_fold_trim(0) <= resize(signed(weight_fold_raw(0)), weight_fold_trim(0)'length);
                weight_fold_trim(1) <= resize(signed(weight_fold_raw(1)), weight_fold_trim(1)'length);
                weight_fold_trim(2) <= resize(signed(weight_fold_raw(2)), weight_fold_trim(2)'length);
                weight_fold_trim(3) <= resize(signed(weight_fold_raw(3)), weight_fold_trim(3)'length);
                val_full <= weight_fold_trim(3) + weight_fold_trim(2) + weight_fold_trim(1) + weight_fold_trim(0);
                --Original algorithm shifts 13 bits, found empirically by looking at output of Matlab generated block
                --Resize eliminates or adds any leading 0s for positive and 1s for a negative number. In simulations so far
                --We haven't overflowed. But with adding four 46 bit values (14 bits x 32 bits), it's possible that a
                --Bit shift of 13 may not be enough. Maybe this should be configurable
                val_out <= std_logic_vector(resize(shift_right(val_full, shift_num), val_out'length));
            else
                block_valid_s1     <= '0';
                weight_fold_trim   <= (others=>(others=>'0'));
                val_full           <= (others=>'0');
                val_out            <= (others=>'0');
            end if;

            shift_num <= to_integer(unsigned(val_division));
            --It takes 4 cycles to do all that, so pipeline the block level data valid flag alongside it
            block_valid_s2         <= block_valid_s1;
            block_valid_s3         <= block_valid_s2;
            ce_out                 <= block_valid_s2;
        end if;
    end if;
    end process;

    process (clk)
    begin
    if (rising_edge(clk)) then

        if (reset = '1') then

        end if;
    end if;
    end process;
END rtl;
