-- Librairies necessaires
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sequenceur is
	PORT (
	  clk: in STD_LOGIC;
		code: in std_logic;
		count_sortie: in std_logic;
		bouton_ON: in std_logic;
		capteur_mouvement: in std_logic;
		capteur_position: in std_logic;
		count_entree: out std_logic;
		alarme_sonore: out std_logic;
		gyrophare: out std_logic;
		led2: out std_logic
	);

end sequenceur;
architecture Behavioral of sequenceur is
  
-- Liste des quatre etats du sequenceur
  type STATE_TYPE is (repos, alarme_activee, saisie_code, alarme_declenchee);
  
-- Deux signaux de ce type
  signal CURRENT_STATE, NEXT_STATE: STATE_TYPE;


begin

-- Partie REGISTRE

CLOCKED: process (clk)
        begin
          if rising_edge(clk) then
            CURRENT_STATE <= NEXT_STATE;
          end if;
        end process CLOCKED;
        
-- Partie COMBINATOIRE "ETAT FUTUR"
COMB_EF: process (CURRENT_STATE, bouton_ON,  capteur_mouvement, capteur_position, count_sortie, code) is
         begin
         case CURRENT_STATE is
           
         when repos =>
           if (bouton_ON = '1') then NEXT_STATE <= alarme_activee;
           else NEXT_STATE <= repos;
           end if;
           
         when alarme_activee =>
           if (capteur_position = '1') then NEXT_STATE <= alarme_declenchee;
           elsif (capteur_mouvement = '1') then NEXT_STATE <= saisie_code;
           else NEXT_STATE <= alarme_activee;
           end if;
           
         when saisie_code =>
           if (code = '1') then NEXT_STATE <= repos;
           elsif (count_sortie = '1') then NEXT_STATE <= alarme_declenchee;
           else NEXT_STATE <= saisie_code;
           end if;
           
         when alarme_declenchee =>
           if (code = '1') then NEXT_STATE <= repos;
           else NEXT_STATE <= alarme_declenchee;
           end if;
			  
         end case;

         
     end process COMB_EF;


-- Partie COMBINATOIRE "SORTIES"

count_entree <= '1' when (CURRENT_STATE = saisie_code) else '0';   
alarme_sonore <= '1' when (CURRENT_STATE = alarme_declenchee) else '0';
gyrophare <= '1' when (CURRENT_STATE = alarme_declenchee) else '0';
led2 <= '1' when (count_sortie = '1' and CURRENT_STATE = saisie_code) else '0';
end Behavioral;

