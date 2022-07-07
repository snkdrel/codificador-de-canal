library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity codigo_ami is 
    Port ( clk, clr : in std_logic;
           out_sgnl : out std_logic
    );
end codigo_ami;

architecture Behavioral of codigo_ami is
    constant secuencia_binaria : std_logic_vector(0 to 7) := "01100101"; --secuencia a codificar
    --signal sb_counter : integer := 0; --contador para secuencia binaria
begin
    
end Behavioral;
