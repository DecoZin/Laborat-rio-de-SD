library IEEE;
use IEEE.std_logic_1164.all;

entity mux8x1 is
    port(D : in std_logic_vector(7 downto 0);
         SEL : in std_logic_vector(2 downto 0);
         CE : in std_logic;
         MX_OUT : out std_logic);
end mux8x1;

architecture my_mux8x1 of mux8x1 is
    signal SEL01 : std_logic_vector(1 downto 0);
    signal D0, D1 : std_logic_vector(3 downto 0);
    signal MX_OUT0, MX_OUT1 : std_logic;
begin
    SEL01 <= SEL(1) & SEL(0);
    D0 <= D(3 downto 0);
    D1 <= D(7 downto 4);

    mux4x1_proc0 : process (D0, SEL01) begin
        case (SEL01) is
            when "11" => MX_OUT0 <= D0(3);
            when "10" => MX_OUT0 <= D0(2);
            when "01" => MX_OUT0 <= D0(1);
            when "00" => MX_OUT0 <= D0(0);
            when others => MX_OUT0 <= '0';
        end case;
    end process mux4x1_proc0;

    mux4x1_proc1 : process (D1, SEL01) begin
        case (SEL01) is
            when "11" => MX_OUT1 <= D1(3);
            when "10" => MX_OUT1 <= D1(2);
            when "01" => MX_OUT1 <= D1(1);
            when "00" => MX_OUT1 <= D1(0);
            when others => MX_OUT1 <= '0';
        end case;
    end process mux4x1_proc1;

    mux2x1_proc : process (MX_OUT0, MX_OUT1, SEL(2), CE) begin
        if (CE = '1') then
            if (SEL(2) = '1') then
                MX_OUT <= MX_OUT1;
            else
                MX_OUT <= MX_OUT0;
            end if;
        else
            MX_OUT <= '0';
        end if;
    end process mux2x1_proc;
end my_mux8x1;
