library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FUN is
    generic(
        BIT_WIDTH : integer := 3
    );
    port(
        a : in std_logic_vector(BIT_WIDTH-1 downto 0);
        b : in std_logic_vector(BIT_WIDTH-1 downto 0);
        c : out std_logic_vector(BIT_WIDTH-1 downto 0)
    );
end FUN;

architecture rtl of FUN is begin

    c <= a when (a < b) else b;

end rtl;
