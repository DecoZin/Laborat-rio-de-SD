library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mean4 is
    generic ( -- o projeto pode ser feito de forma configuravel:
        W       :       integer := 8
    );
    port (
        CLK     : in    std_logic;
        RST     : in    std_logic;
        INPUT   : in    unsigned(W - 1 downto 0);
        OUTPUT  : out   unsigned(W - 1 downto 0)
    );
end mean4;

architecture arch of mean4 is
begin
    process(CLK, RST) is
        variable var1 : unsigned(W - 1 downto 0);
        variable var2 : unsigned(W - 1 downto 0);
        variable var3 : unsigned(W - 1 downto 0);
        variable var4 : unsigned(W - 1 downto 0);
        variable sum : unsigned(W + 1 downto 0);
    begin
        if (RST = '1') then
            var1 := (others => '0');
            var2 := (others => '0');
            var3 := (others => '0');
            var4 := (others => '0');
        elsif (rising_edge(CLK)) then
            var4 := var3;
            var3 := var2;
            var2 := var1;
            var1 := INPUT;
        end if;
        
        sum := ("00" & var1) + ("00" & var2) + ("00" & var3) + ("00" & var4);
        OUTPUT <= sum(W+1 downto 2);
    end process;
    
end arch;
