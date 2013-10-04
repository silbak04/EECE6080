library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity two_in_nand_gate is
    port(
        a : in std_logic;
        b : in std_logic;
        f : out std_logic
    );
end two_in_nand_gate;

architecture rtl of two_in_nand_gate is begin

    f <= not(a and b) after 670 ps;

end rtl;
