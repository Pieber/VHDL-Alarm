library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alarme is
    Port (
 	   clk: in STD_LOGIC;
		code: in std_logic;
		bouton_ON: in std_logic;
		capteur_mouvement: in std_logic;
		capteur_position: in std_logic;
		alarme_sonore: out std_logic;
		gyrophare: out std_logic;
		led1 : out std_logic;
		led2 : out std_logic
		);
		
end alarme;

Architecture Behavioral of alarme is
signal p,q: std_logic;
begin

u1 : entity work.sequenceur port map ( clk => clk,
                                       code => code,
                                       count_sortie => q,
                                       bouton_ON => bouton_ON,
                                       capteur_mouvement => capteur_mouvement,
                                       capteur_position => capteur_position,
                                       count_entree => p,
                                       alarme_sonore => alarme_sonore,
                                       gyrophare => gyrophare,
													led2 => led2
                                       );
											  
u2 : entity work.counttimer port map ( clk => clk,
                                       count_entree => p,
                                       count_sortie => q,
													led1 => led1
                                     ); 
											  
											  
end Behavioral;
