library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity codigo_nrz is
  Port ( clk, clr : in std_logic;
         out_wave : out std_logic --señal de salida
   );
end codigo_nrz;

architecture Behavioral of codigo_nrz is
    constant secuencia_binaria : std_logic_vector(0 to 7) := "01100100"; --secuencia a codificar
    --signal s : std_logic := '0'; --valor para pasar a out_wave
    signal sb_counter : integer := 0; --contador para secuencia binaria
begin
    
    process(clk, clr)
    begin
        if(rising_edge(clk)) then 
            if sb_counter < 8 then 
                if secuencia_binaria(sb_counter) = '0' then
                    out_wave <= '0';
                else
                    out_wave <= '1';
                end if; 
                sb_counter <= sb_counter + 1;
            end if;
            out_wave <= '0';
        end if;
    end process;

end Behavioral;
