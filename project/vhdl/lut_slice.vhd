library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lut_slice is
    port(
        clk_i   : in std_logic;
        clk_o   : out std_logic;
        d       : in std_logic;
        a       : in std_logic;
        b       : in std_logic;
        q       : out std_logic;
        f       : out std_logic
    );
end lut_slice;

architecture rtl of lut_slice is

    -- flip flop and mux outputs
    signal ff_o  : std_logic_vector(3 downto 0) := (others => '0');
    signal mux_o : std_logic_vector(1 downto 0) := (others => '0');

begin

    -- shifting in from MSB to LSB
    ff1 : entity work.dffposx1
    port map(
        clk => clk_i,
        d   => d,
        q   => ff_o(3)
    );

    ff2 : entity work.dffposx1
    port map(
        clk => clk_i,
        d   => ff_o(3),
        q   => ff_o(2)
    );

    ff3 : entity work.dffposx1
    port map(
        clk => clk_i,
        d   => ff_o(2),
        q   => ff_o(1)
    );

    ff4 : entity work.dffposx1
    port map(
        clk => clk_i,
        d   => ff_o(1),
        q   => ff_o(0)
    );

    -- lut shift out is output from prev ff
    q <= ff_o(0);

    -- select first two outputs of LUT
    -- on sel line A
    mux1 : entity work.mux2x1
    port map(
        a => ff_o(3),
        b => ff_o(2),
        s => a,
        x => mux_o(0)
    );

    -- select last two outputs of LUT
    -- on sel line A
    mux2 : entity work.mux2x1
    port map(
        a => ff_o(1),
        b => ff_o(0),
        s => a,
        x => mux_o(1)
    );

    -- select last two outputs from
    -- each mux on sel line B
    mux3 : entity work.mux2x1
    port map(
        a => mux_o(0),
        b => mux_o(1),
        s => b,
        x => f
    );

    clk_o <= clk_i;

end rtl;
