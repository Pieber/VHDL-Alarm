library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
  
ENTITY tb_sequenceur IS
END tb_sequenceur;
 
ARCHITECTURE behavior OF tb_sequenceur IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sequenceur
    PORT(
             clk: in STD_LOGIC;
		     code: in std_logic;
		     count_sortie: in std_logic;
		     bouton_ON: in std_logic;
		     capteur_mouvement: in std_logic;
		     capteur_position: in std_logic;
		     count_entree: out std_logic;
		     alarme_sonore: out std_logic;
		     gyrophare: out std_logic
        );
    END COMPONENT;
    

        --Inputs

		signal clk : STD_LOGIC := '0';
		signal code:  std_logic := '0';
		signal count_sortie:  std_logic := '0';
		signal bouton_ON:  std_logic := '0';
		signal capteur_mouvement:  std_logic := '0';
		signal capteur_position:  std_logic := '0';

 	--Outputs

		signal count_entree:  std_logic;
		signal alarme_sonore:  std_logic;
		signal gyrophare:  std_logic;

   	-- Clock period definitions
                constant clk_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sequenceur PORT MAP (
             clk =>  clk,
		     code => code,
		     count_sortie => count_sortie,
		     bouton_ON => bouton_ON,
		     capteur_mouvement => capteur_mouvement,
		     capteur_position => capteur_position,
		     count_entree => count_entree,
		     alarme_sonore => alarme_sonore,
		     gyrophare => gyrophare
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

      -- insert stimulus here 
      		    code <= '0';
		    count_sortie <= '0';
		    bouton_ON <= '0';
		    capteur_mouvement <= '0';
		    capteur_position <= '0'; 
		    wait for 100 ns;
		    
		    code <= '0';
		    count_sortie <= '0';
		    bouton_ON <= '1';
		    capteur_mouvement <= '0';
		    capteur_position <= '0'; 
		    wait for 100 ns;

		    code <= '0';
		    count_sortie <= '0';
		    bouton_ON <= '0';
		    capteur_mouvement <= '0';
		    capteur_position <= '1'; 
		    wait for 100 ns;

		    code <= '1';
		    count_sortie <= '0';
		    bouton_ON <= '0';
		    capteur_mouvement <= '0';
		    capteur_position <= '0'; 
		    wait for 100 ns;

      		    code <= '0';
		    count_sortie <= '0';
		    bouton_ON <= '0';
		    capteur_mouvement <= '1';
		    capteur_position <= '0'; 
		    wait for 100 ns;

      		    code <= '0';
		    count_sortie <= '0';
		    bouton_ON <= '1';
		    capteur_mouvement <= '0';
		    capteur_position <= '0'; 
		    wait for 100 ns;

      		    code <= '0';
		    count_sortie <= '0';
		    bouton_ON <= '0';
		    capteur_mouvement <= '1';
		    capteur_position <= '0'; 
		    wait for 100 ns;

      		    code <= '1';
		    count_sortie <= '0';
		    bouton_ON <= '0';
		    capteur_mouvement <= '0';
		    capteur_position <= '0'; 
		    wait for 100 ns;

      		    code <= '0';
		    count_sortie <= '0';
		    bouton_ON <= '0';
		    capteur_mouvement <= '0';
		    capteur_position <= '0'; 
		    wait for 100 ns;

      		    code <= '0';
		    count_sortie <= '0';
		    bouton_ON <= '1';
		    capteur_mouvement <= '0';
		    capteur_position <= '0'; 
		    wait for 100 ns;

      		    code <= '0';
		    count_sortie <= '0';
		    bouton_ON <= '0';
		    capteur_mouvement <= '1';
		    capteur_position <= '0'; 
		    wait for 100 ns;

      		    code <= '0';
		    count_sortie <= '1';
		    bouton_ON <= '0';
		    capteur_mouvement <= '0';
		    capteur_position <= '0'; 
		    wait for 100 ns;

      		    code <= '1';
		    count_sortie <= '0';
		    bouton_ON <= '0';
		    capteur_mouvement <= '0';
		    capteur_position <= '0'; 
		    wait for 100 ns;



      wait;
   end process;

END;		    