library IEEE;
use IEEE.std_logic_1164.all;

entity mux4x1 is
    port(D : in std_logic_vector(3 downto 0);
         SEL : in std_logic_vector(1 downto 0);
         MX_OUT : out std_logic);
end mux4x1;

architecture my_mux4x1 of mux4x1 is
begin
    with SEL select
    MX_OUT <= D(3) when "11",
              D(2) when "10",
              D(1) when "01",
              D(0) when "00",
              '0' when others;
end my_mux4x1;