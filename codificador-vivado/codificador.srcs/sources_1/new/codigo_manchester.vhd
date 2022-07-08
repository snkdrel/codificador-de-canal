library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity codigo_manchester is 
    Port ( clk, clr : in std_logic;
           out_sgnl : out std_logic
    );
end codigo_manchester;

architecture Behavioral of codigo_manchester is
    constant secuencia_binaria : std_logic_vector(0 to 7) := "01100101"; --secuencia a codificar
    signal sb_counter : integer := 0; --contador para secuencia binaria
begin
    process(clk,clr)
    begin
        if rising_edge(clk) then
            if sb_counter < 8 then
                if secuencia_binaria(sb_counter) = '1' then
                    out_sgnl <= '1';
                else
                    out_sgnl <= '0';
                end if;
            else
                out_sgnl <= '0';
            end if;
        elsif falling_edge(clk) then
            if sb_counter < 8 then
                if secuencia_binaria(sb_counter) = '1' then
                    out_sgnl <= '0';
                else
                    out_sgnl <= '1';
                end if;
                sb_counter <= sb_counter + 1;
            else
                out_sgnl <= '0';
            end if;
        end if;
    end process;
end Behavioral;
