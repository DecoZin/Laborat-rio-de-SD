library ieee;
use ieee.std_logic_1164.all;

entity adder is
    generic ( W : integer := 3 );
    port(A, B : in  std_logic_vector(W-1 downto 0);
         CIN  : in  std_logic;
         SUM  : out std_logic_vector(W-1 downto 0);
         COUT : out std_logic);
end adder;

architecture arch of adder is
component fulladd is
    port(A, B, CIN : in  std_logic;
         SUM, COUT : out std_logic);
end component;
    signal C : std_logic_vector(W downto 0);
begin
    C(0) <= CIN;
    COUT <= C(W);
    loop_add : for I in 0 to W-1 generate
        DUT: fulladd port map (a=>a(I), b=>b(I), cin=>c(I),
                               sum=>SUM(I), cout=>C(I+1));
    end generate;
end arch;
