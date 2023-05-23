library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity addtypes is
    port(a : in std_logic_vector(2 downto 0);
         b : in std_logic_vector(1 downto 0);
         us : out unsigned(3 downto 0);
         sigs : out signed(3 downto 0));
end addtypes;

architecture arch of addtypes is
begin
    us <= resize(unsigned(a), us'length) + resize(unsigned(b), us'length);
    sigs <= resize(signed(a), sigs'length) + resize(signed(b), sigs'length);
end arch;
