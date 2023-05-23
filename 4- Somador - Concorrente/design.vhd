library IEEE;
use IEEE.std_logic_1164.all;

entity add3 is
    port(cin : in std_logic; -- "carry in" para a soma
         a, b : in std_logic_vector(2 downto 0); -- "2 numeros de 3 bits para somar"
         s : out std_logic_vector(2 downto 0); -- saida com a soma a+b
         co : out std_logic; -- "carry out" da soma
         of_sig : out std_logic); -- overflow para soma de complemento de 2
end add3;

architecture my_add3 of add3 is
    signal coab : std_logic_vector(2 downto 0);
begin
    add0: process (a(0), b(0), cin) -- add bit 0:
        variable nand_c1, nand_c2, nand_ab : std_logic;
        variable sabh : std_logic;
    begin
        nand_c1 := a(0) nand b(0);
        sabh := (nand_c1 nand a(0)) nand (nand_c1 nand b(0));
        nand_c2 := sabh nand cin;
        s(0) <= (nand_c2 nand sabh) nand (nand_c2 nand cin);
        coab(0) <=  nand_c1 nand nand_c2;
    end process add0;

    add1: process (a(1), b(1), coab(0)) -- add bit 1:
        variable nand_c1, nand_c2, nand_ab : std_logic;
        variable sabh : std_logic;
    begin
        nand_c1 := a(1) nand b(1);
        sabh := (nand_c1 nand a(1)) nand (nand_c1 nand b(1));
        nand_c2 := sabh nand coab(0);
        s(1) <= (nand_c2 nand sabh) nand (nand_c2 nand coab(0));
        coab(1) <=  nand_c1 nand nand_c2;
    end process add1;

    add2: process (a(2), b(2), coab(1)) -- add bit 2:
        variable nand_c1, nand_c2, nand_ab : std_logic;
        variable sabh : std_logic;
    begin
        nand_c1 := a(2) nand b(2);
        sabh := (nand_c1 nand a(2)) nand (nand_c1 nand b(2));
        nand_c2 := sabh nand coab(1);
        s(2) <= (nand_c2 nand sabh) nand (nand_c2 nand coab(1));
        coab(2) <=  nand_c1 nand nand_c2;
    end process add2;

    co <= coab(2);
    of_sig <= coab(2) xor coab(1);
end my_add3;
