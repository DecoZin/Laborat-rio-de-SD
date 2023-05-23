library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_mux is
end tb_mux;

architecture teste of tb_mux is

component mux4x1 is
    port(D : in std_logic_vector(3 downto 0);
         SEL : in std_logic_vector(1 downto 0);
         MX_OUT : out std_logic);
end component;

    signal D : std_logic_vector(3 downto 0);
    signal SEL : std_logic_vector(1 downto 0);
    signal MX_OUT : std_logic;

begin
    instancia_mux: mux4x1 port map (
                   D=>D, SEL=>SEL, MX_OUT=>MX_OUT);

    muxtb : process begin
        SEL <= "00";
        D <= "0001";
        wait for 10 ns;
        D <= not(D);
        wait for 10 ns;

        for ii in 1 to 3 loop
            SEL <= std_logic_vector(unsigned(SEL) + 1);
            D <= not(D) sll 1;
            wait for 10 ns;
            D <= not(D);
            wait for 10 ns;
        end loop;

        -- ultima entrada para fechar o grafico:
        SEL <= "00";
        D <= "0000";
        wait for 10 ns;
        wait; -- nao esquecer de parar o processo
    end process muxtb;

end teste;