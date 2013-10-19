library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
    generic(
        delay : time := 0 ps
    );
    port(
        a : in std_logic;
        b : in std_logic;
        s : in std_logic;
        x : out std_logic
    );
end mux2x1;

architecture rtl of mux2x1 is begin

    x <= a after delay when (s = '0') else
         b after delay when (s = '1');

end rtl;
