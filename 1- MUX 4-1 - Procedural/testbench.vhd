library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_mux is
end tb_mux;

architecture teste of tb_mux is

component mux4x1 is
    port(D3, D2, D1, D0 : in std_logic;
         SEL : in std_logic_vector(1 downto 0);
         MX_OUT : out std_logic);
end component;

    signal D3, D2, D1, D0 : std_logic;
    signal SEL : std_logic_vector(1 downto 0);
    signal MX_OUT : std_logic;

begin
    instancia_mux: mux4x1 port map (
                   D3=>D3, D2=>D2,
                   D1=>D1, D0=>D0,
                   SEL=>SEL, MX_OUT=>MX_OUT);

    D0 <= '0', '1' after 10 ns, '0' after 20 ns;
    D1 <= '0', '1' after 30 ns, '0' after 40 ns;
    D2 <= '0', '1' after 50 ns, '0' after 60 ns;
    D3 <= '0', '1' after 70 ns, '0' after 80 ns;
    
    SEL <= "00", "01" after 30 ns, "10" after 50 ns, "11" after 70 ns, "00" after 90 ns;

end teste;
