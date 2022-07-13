library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity codigo_miller is 
    Port ( clk, clr : in std_logic;
           out_sgnl : out std_logic
    );
end codigo_miller;

architecture Behavioral of codigo_miller is
    constant secuencia_binaria : std_logic_vector(0 to 7) := "01100101"; --secuencia a codificar
    signal sb_counter : integer := 0; --contador para secuencia binaria
    signal nivel_previo : std_logic := '1';
    signal bit_previo : std_logic := '1';
begin

    process(clk, clr)
    begin
        if sb_counter < 8 then
            if rising_edge(clk) then
                if secuencia_binaria(sb_counter) = '0' and bit_previo = '0' then
                    -- cuando hay dos 0s consecutivos
                    out_sgnl <= not nivel_previo;
                else
                    out_sgnl <= nivel_previo;
                end if;
            elsif falling_edge(clk) then
                if secuencia_binaria(sb_counter) = '1' then
                    out_sgnl <= not out_sgnl;
                end if;
                nivel_previo <= out_sgnl;
                bit_previo <= secuencia_binaria(sb_counter);
                sb_counter <= sb_counter + 1;
            end if;
        else
            out_sgnl <= '0';
        end if;
    end process;
    
end Behavioral;
