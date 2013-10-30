library ieee;
use ieee.std_logic_1164.all;

entity mux2x1_del is
    generic(
        delay : time := 315 ps
    );
    port(
        a : in std_logic;
        b : in std_logic;
        s : in std_logic;
        x : out std_logic
    );
end mux2x1_del;

architecture rtl of mux2x1_del is begin

    x <= b after delay when (s = '0') else
         a after delay when (s = '1');

end rtl;