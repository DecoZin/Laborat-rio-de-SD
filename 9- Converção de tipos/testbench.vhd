library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_add is
end tb_add;

architecture teste of tb_add is

component addtypes is
    port(a : in std_logic_vector(2 downto 0);
         b : in std_logic_vector(1 downto 0);
         us : out unsigned(3 downto 0);
         sigs : out signed(3 downto 0));
end component;

    signal a : std_logic_vector(2 downto 0);
    signal b : std_logic_vector(1 downto 0);
    signal us : unsigned(3 downto 0);
    signal sigs : signed(3 downto 0);

begin
    DUT: addtypes port map (a=>a, b=>b, us=>us, sigs=>sigs);

    muxtb : process begin
        for ai in 0 to 7 loop
            a <= std_logic_vector(to_unsigned(ai, a'length));
            for bi in 0 to 3 loop
                b <= std_logic_vector(to_unsigned(bi, b'length));
                wait for 10 ns;
            end loop;
        end loop;

        a <= (others => '0');
        b <= (others => '0');
        wait for 10 ns;
        wait;
    end process muxtb;

end teste;