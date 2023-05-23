library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_add is
end tb_add;

architecture teste of tb_add is
component adder is
    generic ( W : integer := 3 );
    port( A, B : in  std_logic_vector(W-1 downto 0);
          CIN  : in  std_logic;
          SUM  : out std_logic_vector(W-1 downto 0);
          COUT : out std_logic);
end component;

    constant W : integer := 3;
    signal a, b : std_logic_vector(W-1 downto 0);
    signal cin : std_logic;
    signal tot : std_logic_vector(W downto 0);

begin
    DUT: adder generic map (W=>W)
                  port map (a=>a, b=>b, cin=>cin,
                            sum=>tot(W-1 downto 0),
                            cout=>tot(W));

    tb : process
        variable utot, check : integer;
    begin
        for ci in 0 to 1 loop
            cin <= std_logic(to_unsigned(ci, 1)(0));
            for ai in 0 to (2**W)-1 loop
                a <= std_logic_vector(to_unsigned(ai, a'length));
                for bi in 0 to (2**W)-1 loop
                    b <= std_logic_vector(to_unsigned(bi, b'length));
                    wait for 10 ns;
                    utot := to_integer(unsigned(tot));
                    check := ci + ai + bi;
                    assert(utot = check) report "Fail !!! at " &
                                         to_string(ai) & " "
                                         & to_string(bi) severity error;
                end loop;
            end loop;
        end loop;
        report "Test done." severity note;
        a <= (others => '0');
        b <= (others => '0');
        wait for 10 ns;
        wait;
    end process tb;
end teste;