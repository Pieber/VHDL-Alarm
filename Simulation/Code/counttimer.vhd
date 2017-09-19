library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Compteur en se basant sur un signal d'horloge de 25 MHz

entity counttimer is
    generic (
            trigger_cnt:    natural := 125
            );
    Port ( clk : in  STD_LOGIC;
           count_entree : in STD_LOGIC;
           count_sortie : out STD_LOGIC;
           led1 : out std_logic
        	 );
end counttimer;

architecture Behavioral of counttimer is

    signal q: integer range 0 to trigger_cnt ;

begin

timer: 
    process (clk,q)
    begin
        if clk'event and clk = '1' then
				if count_entree = '0' then 
					q <= 0;
            elsif (q /= trigger_cnt) then
                q <= q + 1;
            end if;
        end if;
        if q = trigger_cnt then
            count_sortie <= '1';
        else 
            count_sortie <= '0';
        end if;
     end process;
led1 <= '1' when count_entree = '1' else '0';
end Behavioral;

