library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_add is
end tb_add;

architecture teste of tb_add is

    constant W : integer := 2;

component ula is
    generic (
        W : integer := 8
    );
    port (ina, inb : in std_logic_vector(W-1 downto 0);
          op : in std_logic_vector(1 downto 0);
          res : out std_logic_vector(W-1 downto 0)
    );
end component;

    signal a, b : std_logic_vector(W-1 downto 0);
    signal op : std_logic_vector(1 downto 0);
    signal res : std_logic_vector(W-1 downto 0);

begin
    DUT: ula 
    generic map (W=>W)
    port map (ina=>a, inb=>b, op=>op, res=>res);

    muxtb : process begin
        op <= "00";
        for ai in 0 to (2**W)-1 loop
            a <= std_logic_vector(to_unsigned(ai, a'length));
            for bi in 0 to (2**W)-1 loop
                b <= std_logic_vector(to_unsigned(bi, b'length));
                wait for 10 ns;
            end loop;
        end loop;
        --end loop;

        a <= (others => '0');
        b <= (others => '0');
        op <= (others => '0');
        wait for 10 ns;
        wait;
    end process muxtb;

end teste;