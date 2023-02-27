--/////////////////////////////////////////////////////////////////////
--////                              
--////  File: LED_DIMMER_s.VHD
--////                                                                                                                                      
--////  Author: Jack Fried                                        
--////          jfried@bnl.gov                
--////  Created:  10/22/2013
--////  Modified: 10/22/2013
--////  Description:  
--////                                  
--////
--/////////////////////////////////////////////////////////////////////
--////
--//// Copyright (C) 2014 Brookhaven National Laboratory
--////
--/////////////////////////////////////////////////////////////////////


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_unsigned.all;
 
  
ENTITY LED_DIMMER_s IS
	 
	PORT
	(
		reset					: IN 	STD_LOGIC;				
		clk_40Mhz  			: IN 	STD_LOGIC;	
		DIMMER_CNTL			: IN  STD_LOGIC_VECTOR(15 downto 0); -- for flashing rate use (15..0) for fixed_DIMMING use (8..0)
		FIXED_DIMMER		: IN  STD_LOGIC;							 -- set for a single dim value
		LED_OUT_s			: OUT STD_LOGIC_VECTOR(7 downto 0);
		LED_DIM				: OUT STD_LOGIC
	);
	
END LED_DIMMER_s;


ARCHITECTURE behavior OF LED_DIMMER_s IS


signal counter2		: STD_LOGIC_VECTOR(15 downto 0);
signal counter			: STD_LOGIC_VECTOR(15 downto 0);
signal LED_SETTING	: STD_LOGIC_VECTOR(15 downto 0);
signal CLK_GEN			: STD_LOGIC_VECTOR(7 downto 0);
signal LED_UP			: STD_LOGIC;
signal LED_OUT			: STD_LOGIC;
signal index			: STD_LOGIC_VECTOR(2 downto 0);
	
begin
	
LED_DIM	<= LED_OUT;
	
LED_OUT_s(0)	<= LED_OUT when (index = x"0") else '0';
LED_OUT_s(1)	<= LED_OUT when (index = x"1") else '0';
LED_OUT_s(2)	<= LED_OUT when (index = x"2") else '0';
LED_OUT_s(3)	<= LED_OUT when (index = x"3") else '0';
LED_OUT_s(4)	<= LED_OUT when (index = x"4") else '0';
LED_OUT_s(5)	<= LED_OUT when (index = x"5") else '0';
LED_OUT_s(6)	<= LED_OUT when (index = x"6") else '0';
LED_OUT_s(7)	<= LED_OUT when (index = x"7") else '0';	
	
	
	
	
	
  process(clk_40Mhz,reset) 
  begin
   if (reset = '0') then
		counter2 <= x"0000";
		LED_SETTING <= x"0000";
		LED_UP		<= '0';
		index			<=	b"000";
		CLK_GEN		<= x"00";
	elsif rising_edge(clk_40Mhz) then
		CLK_GEN	<= CLK_GEN +1;
		if( CLK_GEN >= 15) then
				CLK_GEN	<= x"00";
				counter2 <= counter2 + 1;
				if (counter2 >= DIMMER_CNTL) then
					counter2 <= x"0000";
					if(LED_UP	= '0') then	
						LED_SETTING <= LED_SETTING + 1;
						if(LED_SETTING >= 512) then
								LED_UP		<= '1';
								index		<= index +1;								
						end if;
					else
						LED_SETTING <= LED_SETTING - 1;
						if(LED_SETTING = 0) then
								LED_SETTING <= x"0000";
								LED_UP		<= '0';
						end if;
					end if;
				end if;		
				if(FIXED_DIMMER = '1') then
					LED_SETTING <= DIMMER_CNTL;
				end if;
		end if;
			
	end if;
end process;

-------------------- This section dims the LED  set LED_SETTING to a fixed value will 
  process(clk_40Mhz,reset) 
  begin
   if (reset= '0') then	
		LED_OUT <= '1';
		counter <= x"0000";
	elsif rising_edge(clk_40Mhz) then

		counter	<= counter + 1;
		LED_OUT <= '1';
		if( counter > 512) then
		 counter <= x"0000";
		end if;
		if (LED_SETTING > counter) then
			LED_OUT <= '0';
		end if;

	end if;
end process;

	
END behavior;