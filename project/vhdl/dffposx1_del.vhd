library ieee;
use ieee.std_logic_1164.all;

entity dffposx1_del is
    generic(
        delay : time := 203.5 ps
    );
    port(
        clk : in std_logic;
        d   : in std_logic;
        q   : out std_logic
    );
end dffposx1;

architecture rtl of dffposx1_del is begin
    process(clk) begin
        if rising_edge(clk) then
            q <= d after delay;
        end if;
    end process;
end rtl;
