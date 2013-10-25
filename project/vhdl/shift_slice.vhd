library ieee;
use ieee.std_logic_1164.all;

entity shift_slice is
    port(
        clk_i   : in std_logic;
        p       : in std_logic;
        clk_o   : out std_logic;
        q       : out std_logic
    );
end shift_slice;

architecture rtl of shift_slice is begin

    ff_p1 : entity work.dffposx1 port map(clk_i, p, q);

    clk_o <= clk_i;

end rtl;
