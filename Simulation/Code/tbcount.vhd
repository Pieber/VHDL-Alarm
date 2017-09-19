library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY tb_counttimer IS
END tb_counttimer;
 
ARCHITECTURE behavior OF tb_counttimer IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counttimer
    PORT(
           clk : in  STD_LOGIC;
           count_entree : in STD_LOGIC;
           count_sortie : out STD_LOGIC
        );
    END COMPONENT counttimer;
    

   	--Inputs

   signal clk : std_logic := '0';
   signal count_entree : std_logic:='0';

 	--Outputs

   signal count_sortie : std_logic;

 	--Clock

   constant clk_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counttimer PORT MAP (
          clk => clk,
          count_entree => count_entree,
          count_sortie => count_sortie
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
    
	count_entree <= '1';
	
      wait;
   end process;

END;
