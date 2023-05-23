library IEEE;
use IEEE.std_logic_1164.all;

entity tb_oddeven is
end tb_oddeven;

architecture teste of tb_oddeven is
component oddeven is
port (  CLK, RST : in std_logic;
        Num : in std_logic_vector(2 downto 0);
        Odd, OddNext : out std_logic);
end component;

constant PERIODO : time := 10 ns;
signal CLK : std_logic := '0';
signal CLK_ENABLE: std_logic := '1';

signal RST : std_logic;
signal Num : std_logic_vector(2 downto 0);
signal Odd, OddNext : std_logic;

begin
    CLK <= CLK_ENABLE and not CLK after PERIODO / 2;
    -- tempo da simulacao em ciclos de clock:
    CLK_ENABLE <= '1', '0' after 20 * PERIODO;

    DUT : oddeven port map(CLK => CLK, RST => RST,
          Num => Num, Odd => Odd, OddNext => OddNext);

    stimulus: process
    begin
        Num <= "000";
        RST <= '1';
        wait for PERIODO;
        RST <= '0';
        Num <= "000";
        wait for PERIODO;
        Num <= "011";
        wait for PERIODO;
        Num <= "110";
        wait for PERIODO;
        Num <= "101";
        wait for PERIODO;

        Num <= "001";
        wait for PERIODO;
        wait for PERIODO;
        Num <= "010";
        wait for PERIODO;
        wait for PERIODO;
        Num <= "100";
        wait for PERIODO;
        wait for PERIODO;
        Num <= "111";
        wait for PERIODO;
        wait for PERIODO;

        Num <= "001";
        wait for PERIODO;
        Num <= "000";
        wait for PERIODO;
        Num <= "011";
        wait for PERIODO;
        Num <= "110";
        wait for PERIODO;
        Num <= "101";
        wait for PERIODO;

        Num <= "000";
        wait for PERIODO;
        wait;
    end process stimulus;
end teste;