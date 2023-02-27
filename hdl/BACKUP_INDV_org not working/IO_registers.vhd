--*********************************************************
--* FILE  : IO_registers.VHD
--* Author: Jack Fried
--*
--* Last Modified: 5/19/2013
--*  
--* Description: interface to the TSE UDP IO
--*		 		               
--*
--*
--*********************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

--use IEEE.NUMERIC_STD.ALL;




ENTITY IO_registers IS

	PORT
	(
		nrst            : IN STD_LOGIC;				-- state machine reset
		clk             : IN STD_LOGIC;
		Ver_ID		    : IN STD_LOGIC_VECTOR(31 downto 0);	
		data            : IN STD_LOGIC_VECTOR(31 downto 0);	
		WR_address      : IN STD_LOGIC_VECTOR(15 downto 0); 
		RD_address      : IN STD_LOGIC_VECTOR(15 downto 0); 
		WR    	 	    : IN STD_LOGIC;				
		data_out		: OUT  STD_LOGIC_VECTOR(31 downto 0);		

		reg0_i		: IN  STD_LOGIC_VECTOR(31 downto 0);		
		reg1_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg2_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg3_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg4_i		: IN  STD_LOGIC_VECTOR(31 downto 0);		
		reg5_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg6_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg7_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg8_i		: IN  STD_LOGIC_VECTOR(31 downto 0);		
		reg9_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg10_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg11_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg12_i		: IN  STD_LOGIC_VECTOR(31 downto 0);		
		reg13_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg14_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg15_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg16_i		: IN  STD_LOGIC_VECTOR(31 downto 0);		
		reg17_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg18_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg19_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg20_i		: IN  STD_LOGIC_VECTOR(31 downto 0);		
		reg21_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg22_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg23_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg24_i		: IN  STD_LOGIC_VECTOR(31 downto 0);		
		reg25_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg26_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg27_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg28_i		: IN  STD_LOGIC_VECTOR(31 downto 0);		
		reg29_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg30_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg31_i		: IN  STD_LOGIC_VECTOR(31 downto 0);		
		reg32_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg33_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg34_i		: IN  STD_LOGIC_VECTOR(31 downto 0);		
		reg35_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg36_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg37_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg38_i		: IN  STD_LOGIC_VECTOR(31 downto 0);		
		reg39_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg40_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg41_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg42_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg43_i		: IN  STD_LOGIC_VECTOR(31 downto 0);
		reg44_i		: IN  STD_LOGIC_VECTOR(31 downto 0);		
		reg45_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg46_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg47_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg48_i		: IN  STD_LOGIC_VECTOR(31 downto 0);		
		reg49_i		: IN  STD_LOGIC_VECTOR(31 downto 0);	
		reg50_i		: IN  STD_LOGIC_VECTOR(31 downto 0);		
		
		reg0_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);		
		reg1_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg2_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg3_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg4_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);		
		reg5_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg6_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg7_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg8_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);		
		reg9_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg10_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg11_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg12_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);		
		reg13_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg14_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg15_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg16_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);		
		reg17_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg18_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg19_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg20_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);		
		reg21_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg22_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg23_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg24_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);		
		reg25_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg26_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg27_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg28_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);		
		reg29_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg30_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg31_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
	    reg32_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg33_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg34_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);		
		reg35_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg36_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);			
		reg37_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg38_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);		
		reg39_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);			
		reg40_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg41_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);
		reg42_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg43_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);
		reg44_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);		
		reg45_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg46_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg47_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg48_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);		
		reg49_o		: OUT  STD_LOGIC_VECTOR(31 downto 0);	
		reg50_o		: OUT  STD_LOGIC_VECTOR(31 downto 0)	
		
	);
	
END IO_registers;


ARCHITECTURE behavior OF IO_registers IS


SIGNAL	SCRATCH_PAD			: STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL	WR_DLY				: STD_LOGIC;
signal	VERSION	 			: STD_LOGIC_VECTOR (31 DOWNTO 0);  							 
signal	DATE_O	 			: STD_LOGIC_VECTOR (31 DOWNTO 0);  	 				 
signal	TIME_O				: STD_LOGIC_VECTOR (31 DOWNTO 0);  	 


begin

	

  data_out		<= reg0_i 	when (RD_address(11 downto 0) = x"000")	else
                   reg1_i 	when (RD_address(11 downto 0) = x"001")	else
                   reg2_i 	when (RD_address(11 downto 0) = x"002")	else
                   reg3_i 	when (RD_address(11 downto 0) = x"003")	else
                   reg4_i 	when (RD_address(11 downto 0) = x"004")	else
                   reg5_i 	when (RD_address(11 downto 0) = x"005")	else
                   reg6_i 	when (RD_address(11 downto 0) = x"006")	else
                   reg7_i 	when (RD_address(11 downto 0) = x"007")	else
                   reg8_i 	when (RD_address(11 downto 0) = x"008")	else
                   reg9_i 	when (RD_address(11 downto 0) = x"009")	else
                   reg10_i	when (RD_address(11 downto 0) = x"00a")	else
                   reg11_i	when (RD_address(11 downto 0) = x"00b")	else
                   reg12_i	when (RD_address(11 downto 0) = x"00c")	else
                   reg13_i	when (RD_address(11 downto 0) = x"00d")	else
                   reg14_i	when (RD_address(11 downto 0) = x"00e")	else
                   reg15_i	when (RD_address(11 downto 0) = x"00f")	else
                   reg16_i	when (RD_address(11 downto 0) = x"010")	else
                   reg17_i	when (RD_address(11 downto 0) = x"011")	else
                   reg18_i	when (RD_address(11 downto 0) = x"012")	else
                   reg19_i	when (RD_address(11 downto 0) = x"013")	else
                   reg20_i	when (RD_address(11 downto 0) = x"014")	else
                   reg21_i	when (RD_address(11 downto 0) = x"015")	else
                   reg22_i	when (RD_address(11 downto 0) = x"016")	else
                   reg23_i	when (RD_address(11 downto 0) = x"017")	else
                   reg24_i	when (RD_address(11 downto 0) = x"018")	else
                   reg25_i	when (RD_address(11 downto 0) = x"019")	else
                   reg26_i	when (RD_address(11 downto 0) = x"01a")	else
                   reg27_i	when (RD_address(11 downto 0) = x"01b")	else
                   reg28_i	when (RD_address(11 downto 0) = x"01c")	else
                   reg29_i	when (RD_address(11 downto 0) = x"01d")	else
                   reg30_i	when (RD_address(11 downto 0) = x"01e")	else
                   reg31_i	when (RD_address(11 downto 0) = x"01f") else
                   reg32_i	when (RD_address(11 downto 0) = x"020")	else
                   reg33_i	when (RD_address(11 downto 0) = x"021")	else
                   reg34_i	when (RD_address(11 downto 0) = x"022")	else
                   reg35_i	when (RD_address(11 downto 0) = x"023")	else
                   reg36_i	when (RD_address(11 downto 0) = x"024")	else
                   reg37_i	when (RD_address(11 downto 0) = x"025")	else
                   reg38_i	when (RD_address(11 downto 0) = x"026")	else
                   reg39_i	when (RD_address(11 downto 0) = x"027")	else
                   reg40_i	when (RD_address(11 downto 0) = x"028")	else
                   reg41_i	when (RD_address(11 downto 0) = x"029") else						 
                   reg42_i	when (RD_address(11 downto 0) = x"02A")	else
                   reg43_i	when (RD_address(11 downto 0) = x"02B") else
                   reg44_i	when (RD_address(11 downto 0) = x"02C")	else
                   reg45_i	when (RD_address(11 downto 0) = x"02D")	else
                   reg46_i	when (RD_address(11 downto 0) = x"02E")	else
                   reg47_i	when (RD_address(11 downto 0) = x"02F")	else
                   reg48_i	when (RD_address(11 downto 0) = x"030")	else
                   reg49_i	when (RD_address(11 downto 0) = x"031")	else
                   reg50_i	when (RD_address(11 downto 0) = x"032")	else
				   SCRATCH_PAD	 when (RD_address(11 downto 0) = x"0fe")  else	 
				   Ver_ID	    	 when (RD_address(11 downto 0) = x"0ff")  else	
                   X"00000000";
		

					 
  process(clk,WR,nrst) 
  begin
		if (nrst = '0') then
			reg0_o		<= X"00000000";		
			reg1_o		<= X"00000000";	
			reg2_o		<= X"00000000";
			reg3_o		<= X"00000000";
			reg4_o		<= X"00000000";
			reg5_o		<= X"00000000";
			reg6_o		<= X"00000000";	
			reg7_o		<= X"00000000";	
			reg8_o		<= X"00000000";	
			reg9_o		<= X"00000000";	
			reg10_o		<= X"00000000";
			reg11_o		<= X"00000000";	
			reg12_o		<= X"00000000";		
			reg13_o		<= X"00000000";
			reg14_o		<= X"00000000";	
			reg15_o		<= X"00000000";
			reg16_o		<= X"00000000";		
			reg17_o		<= X"00000000";	
			reg18_o		<= X"00000000";
			reg19_o		<= X"00000000";
			reg20_o		<= X"00000000";	
			reg21_o		<= X"00000000";	
			reg22_o		<= X"00000000";	
			reg23_o		<= X"00000000";	
			reg24_o		<= X"00000000";		
			reg25_o		<= X"00000000";
			reg26_o		<= X"00000000";
			reg27_o		<= X"00000000";
			reg28_o		<= X"00000000";		
			reg29_o		<= X"00000000";
			reg30_o		<= X"00000000";
			reg31_o		<= X"00000000"; 
		    reg32_o		<= X"00000000";	
			reg33_o		<= X"00000000";	
			reg34_o		<= X"00000000";		
			reg35_o		<= X"00000000";
			reg36_o		<= X"00000000";			
			reg37_o		<= X"00000000";
			reg38_o		<= X"00000000";		
			reg39_o		<= X"00000000";			
			reg40_o		<= X"00000000";	
			reg41_o		<= X"00000000";		
			reg42_o		<= X"00000000";	
			reg43_o		<= X"00000000";			
	        reg44_o		<= X"00000000";		
			reg45_o		<= X"00000000";
			reg46_o		<= X"00000000";			
			reg47_o		<= X"00000000";
			reg48_o		<= X"00000001";		
			reg49_o		<= X"00001000";			
			reg50_o		<= X"000001F8";			

			
		elsif (clk'event  AND  clk = '1') then
			reg0_o(7 downto 0)	<= X"00";					
			if (WR = '1') then
				CASE WR_address(11 downto 0) IS
					when x"000" => 	reg0_o   <= data;
					when x"001" => 	reg1_o   <= data;	
					when x"002" => 	reg2_o   <= data;
					when x"003" => 	reg3_o   <= data;
					when x"004" => 	reg4_o   <= data;
					when x"005" => 	reg5_o   <= data;
					when x"006" => 	reg6_o   <= data;
					when x"007" => 	reg7_o   <= data;
					when x"008" => 	reg8_o   <= data;
					when x"009" => 	reg9_o   <= data;	
					when x"00A" => 	reg10_o   <= data;
					when x"00B" => 	reg11_o   <= data;
					when x"00C" => 	reg12_o   <= data;
					when x"00D" => 	reg13_o   <= data;
					when x"00E" => 	reg14_o   <= data;
					when x"00F" => 	reg15_o   <= data;
					when x"010" => 	reg16_o   <= data;
					when x"011" => 	reg17_o   <= data;
					when x"012" => 	reg18_o   <= data;
					when x"013" => 	reg19_o   <= data;
					when x"014" => 	reg20_o   <= data;
					when x"015" => 	reg21_o   <= data;
					when x"016" => 	reg22_o   <= data;
					when x"017" => 	reg23_o  <= data;
					when x"018" => 	reg24_o  <= data;
					when x"019" => 	reg25_o  <= data;
					when x"01A" => 	reg26_o  <= data;
					when x"01B" => 	reg27_o  <= data;
					when x"01C" => 	reg28_o  <= data;
					when x"01D" => 	reg29_o  <= data;
					when x"01E" => 	reg30_o  <= data;
					when x"01F" => 	reg31_o  <= data;	
				    when x"020" => 	reg32_o   <= data;
					when x"021" => 	reg33_o   <= data;
					when x"022" => 	reg34_o   <= data;
					when x"023" => 	reg35_o   <= data;
					when x"024" => 	reg36_o   <= data;					
					when x"025" => 	reg37_o  <= data;
					when x"026" => 	reg38_o  <= data;
					when x"027" => 	reg39_o  <= data;
					when x"028" => 	reg40_o  <= data;
					when x"029" => 	reg41_o  <= data;	
					when x"02A" => 	reg42_o  <= data;
					when x"02B" => 	reg43_o  <= data;
					when x"02C" => 	reg44_o   <= data;
					when x"02D" => 	reg45_o   <= data;
					when x"02E" => 	reg46_o   <= data;					
					when x"02F" => 	reg47_o  <= data;
					when x"030" => 	reg48_o  <= data;
					when x"031" => 	reg49_o  <= data;
					when x"032" => 	reg50_o  <= data;
					when x"0FE" =>  SCRATCH_PAD <= data;
					WHEN OTHERS =>  
				end case;  
			 end if;
	end if;
end process;
	
END behavior;
