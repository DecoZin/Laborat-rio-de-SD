library IEEE;
use IEEE.std_logic_1164.all;

entity d_ff is
port (  D, CLK, R, S, E : in std_logic;
        Q, Qn : out std_logic);
end d_ff;

architecture my_d_ff of d_ff is
begin -- Não crie "copias" do sinal de clock
    dff: process ()
    begin
    end process dff;
end my_d_ff;