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

architecture rtl of shift_slice is

    component dffposx1
        port(
            clk : in std_logic;
            d   : in std_logic;
            q   : out std_logic
        );
    end component;

begin

    ff_p1 : dffposx1
    port map(
        clk => clk_i,
        d   => p,
        q   => q
    );

    clk_o <= clk_i;

end rtl;
