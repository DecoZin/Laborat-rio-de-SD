library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_add is
end tb_add;

architecture teste of tb_add is

component add3 is
    port(cin : in std_logic; -- "carry in" para a soma
         a, b : in std_logic_vector(2 downto 0); -- "2 numeros de 3 bits para somar"
         s : out std_logic_vector(2 downto 0); -- saida com a soma a+b
         co : out std_logic; -- "carry out" da soma
         of_sig : out std_logic); -- overflow para soma de complemento de 2
end component;

    signal a, b : std_logic_vector(2 downto 0);
    signal s : std_logic_vector(2 downto 0);
    signal cin, co, of_sig : std_logic;

begin
    DUT: add3 port map (cin => cin, a=>a, b=>b,
                        s=>s, co=>co, of_sig=>of_sig);

    muxtb : process begin
        cin <= '0';
        a <= (others => '0');
        b <= (others => '0');

        for ai in 1 to 7 loop
            wait for 10 ns;
            a <= std_logic_vector((unsigned(a) + 1));
            for bi in 0 to 7 loop
                wait for 10 ns;
                b <= std_logic_vector((unsigned(b) + 1));
            end loop;
        end loop;
        wait for 10 ns;

        -- ultima entrada para fechar o grafico:
        a <= (others => '0');
        b <= (others => '0');
        wait for 10 ns;
        wait; -- nao esquecer de parar o processo
    end process muxtb;

end teste;