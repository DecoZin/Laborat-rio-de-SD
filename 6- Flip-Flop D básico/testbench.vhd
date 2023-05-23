library IEEE;
use IEEE.std_logic_1164.all;

entity tb_ffd is
end tb_ffd;

architecture teste of tb_ffd is
component d_ff is
    port (  D, CLK, R, S, E : in std_logic;
            Q, Qn : out std_logic);
end component;

constant PERIOD : time := 10 ns;
signal CLK : std_logic := '0';
signal CLK_ENABLE: std_logic := '1';

signal RST, D, R, S, E, Q, Qn : std_logic;

begin
    CLK <= CLK_ENABLE and not CLK after PERIOD / 2;

    DUT : d_ff port map(CLK => CLK, R => R, S => S, E => E,
                        D => D, Q => Q, Qn => Qn);

    stimulus: process
    begin -- Mude as entradas somente nas bordas opostas à sensibilidade do clock
        D <= '0';
        RST <= '1';
        wait for PERIOD;
        RST <= '0';
        D <= '1';
        wait for PERIOD;
        D <= '0';
        wait for 2 * PERIOD;
        CLK_ENABLE <= '0';
        wait;
    end process stimulus;
end teste;