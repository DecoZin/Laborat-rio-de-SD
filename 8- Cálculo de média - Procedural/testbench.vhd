library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_mean4 is
end tb_mean4;

architecture teste of tb_mean4 is
-- pode ser diferente a cada instancia:
constant BITS : integer := 8;

component mean4 is
    generic (
        W       :       integer := 8
    );
    port (
        CLK     : in    std_logic;
        RST     : in    std_logic;
        INPUT   : in    unsigned(W - 1 downto 0);
        OUTPUT  : out   unsigned(W - 1 downto 0)
    );
end component;

constant PERIODO : time := 10 ns;
signal CLK : std_logic := '0';
signal CLK_ENABLE: std_logic := '1';

signal RST : std_logic;
signal num : unsigned(BITS-1 downto 0);
signal avg : unsigned(BITS-1 downto 0);

begin
    CLK <= CLK_ENABLE and not CLK after PERIODO/2;
    CLK_ENABLE <= '1', '0' after 20*PERIODO;

    DUT : mean4 generic map(W => BITS)
                port map(CLK => CLK,
                         RST => RST,
                         INPUT => num,
                         OUTPUT => avg);

    stimulus: process
    begin
        num <= (others => '0');
        RST <= '1';
        wait for 2*PERIODO;
        RST <= '0';
        num <= num + 2;
        wait for 4*PERIODO;
        num <= num + 2;
        wait for 4*PERIODO;
        num <= num + 2;
        wait for 4*PERIODO;
        num <= num + 2;
        wait for 4*PERIODO;
        wait;
    end process stimulus;
end teste;
