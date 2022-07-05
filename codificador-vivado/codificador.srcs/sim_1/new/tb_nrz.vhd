-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 4.7.2022 18:42:29 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_codigo_nrz is
end tb_codigo_nrz;

architecture tb of tb_codigo_nrz is

    component codigo_nrz
        port (clk      : in std_logic;
              clr      : in std_logic;
              out_wave : out std_logic);
    end component;

    signal clk      : std_logic;
    signal clr      : std_logic;
    signal out_wave : std_logic;

    constant TbPeriod : time := 100 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : codigo_nrz
    port map (clk      => clk,
              clr      => clr,
              out_wave => out_wave);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed

        -- Reset generation
        -- EDIT: Check that clr is really your reset signal
        clr <= '1';
        wait for 100 ns;
        clr <= '0';
        wait for 100 ns;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_codigo_nrz of tb_codigo_nrz is
    for tb
    end for;
end cfg_tb_codigo_nrz;