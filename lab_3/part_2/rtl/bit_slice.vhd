library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bit_slice is
    port(
        a   : in std_logic;
        b   : in std_logic;

        q_i : in std_logic;
        q_o : out std_logic;

        sel : in std_logic;
        min : out std_logic
    );
end bit_slice;

architecture rtl of bit_slice is begin

    -- comparator
    q_o <= '1' when (a = '0' and b = '1') else
           '0' when (a = '1' and b = '0') else
           q_i;

    min <= a when (sel = '1') else
           b when (sel = '0');

end rtl;
