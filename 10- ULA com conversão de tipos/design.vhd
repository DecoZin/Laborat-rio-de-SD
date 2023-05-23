library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity ula is
    generic (W : integer := 8);
    port (ina, inb : in std_logic_vector(W-1 downto 0);
          op : in std_logic_vector(1 downto 0);
          res : out std_logic_vector(W-1 downto 0));
end ula;

architecture arch of ula is
component adder is
    generic ( W : integer := 8 );
    port (A, B : in  std_logic_vector(W-1 downto 0);
          SUM  : out std_logic_vector(W-1 downto 0));
end component;

    signal A, B : std_logic_vector(W-1 downto 0);
    signal nA, nB : std_logic_vector(W-1 downto 0);

begin
    add: adder generic map (W=>W)
               port map (A=>A, B=>B, SUM=>res);

    nA <= std_logic_vector(unsigned(not(A)) + to_unsigned(1, W));
    nB <= std_logic_vector(unsigned(not(B)) + to_unsigned(1, W));

    ULAP : process (ina, inb, op)
    begin
        A <= ina;
        B <= inb;
        case (op) is
        when "01" => -- A - B
            B <= nB;
        when "10" => -- B - A
            A <= nA;
        when "11" => -- -A -B
            A <= nA;
            B <= nB;
        when "00" => -- A + B
        when others =>
        end case;
    end process ULAP;
end arch;