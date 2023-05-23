library IEEE;
use IEEE.std_logic_1164.all;

entity oddeven is -- acumula quantidade par/impar de bits 1
port (  CLK, RST : in std_logic;
        Num : in std_logic_vector(2 downto 0);
        Odd, OddNext : out std_logic);
end oddeven;

architecture arch of oddeven is
    --signal InEven : std_logic;
begin
    state: process (CLK, RST)
    begin
        if (RST = '1') then
            Odd <= '0';
        elsif (rising_edge(CLK)) then
            Odd <= OddNext;
        end if;
    end process state;
    OddNext <= xor(Odd & Num);

    -- Exemplo de uma descrição estruturada:
    --input: process (Num)
    --begin
    --    case Num is
    --    when "000" => InEven <= '1';
    --    when "011" => InEven <= '1';
    --    when "110" => InEven <= '1';
    --    when "101" => InEven <= '1';
    --    when others => InEven <= '0';
    --    end case;
    --end process input;

    --nextst: process (Odd, InEven)
    --begin
    --    if (Odd = '0') then
    --        if (InEven = '1') then
    --            OddNext <= '0';
    --        else
    --            OddNext <= '1';
    --        end if;
    --    else
    --        if (InEven = '1') then
    --            OddNext <= '1';
    --        else
    --            OddNext <= '0';
    --        end if;
    --    end if;
    --end process nextst;
    --*/
end arch;
