library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lut_slice is
    port(
        clk_i   : in std_logic;
        d       : in std_logic;
        a       : in std_logic;
        b       : in std_logic;
        clk_o   : out std_logic;
        q       : out std_logic;
        f       : out std_logic
    );
end lut_slice;

architecture rtl of lut_slice is

    component dffposx1 is
        port(
            clk : in std_logic;
            d   : in std_logic;
            q   : out std_logic
        );
    end component;

    component mux2x1 is
        port(
            a : in std_logic;
            b : in std_logic;
            s : in std_logic;
            x : out std_logic
        );
    end component;

    -- flip flop and mux outputs
    signal ff_o  : std_logic_vector(3 downto 0) := (others => '0');
    signal mux_o : std_logic_vector(1 downto 0) := (others => '0');

begin

    -- shifting in from LSB to MSB
    ff1 : dffposx1 port map(clk_i, d,       ff_o(0));
    ff2 : dffposx1 port map(clk_i, ff_o(0), ff_o(1));
    ff3 : dffposx1 port map(clk_i, ff_o(1), ff_o(2));
    ff4 : dffposx1 port map(clk_i, ff_o(2), ff_o(3));

    -- lut shift out is output from prev ff
    q <= ff_o(3);

    -- select first two outputs of LUT
    -- on sel line A
    mux2 : mux2x1 port map(ff_o(0), ff_o(1), a, mux_o(0));

    -- select last two outputs of LUT
    -- on sel line A
    mux1 : mux2x1 port map(ff_o(2), ff_o(3), a, mux_o(1));

    -- select the outputs from
    -- each mux on sel line B
    mux3 : mux2x1 port map(mux_o(0), mux_o(1), b, f);

    clk_o <= clk_i;

end rtl;
