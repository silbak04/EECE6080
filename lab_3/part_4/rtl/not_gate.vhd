library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity not_gate is
    port(
        a : in std_logic;
        f : out std_logic
    );
end not_gate;

architecture rtl of not_gate is begin

    f <= not(a) after 191.28 ps;

end rtl;
