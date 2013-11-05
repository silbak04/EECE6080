library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lut_slice_del is
    port(
        clk_i   : in std_logic;
        d       : in std_logic;
        a       : in std_logic;
        b       : in std_logic;
        q       : out std_logic;
        f       : out std_logic
    );
end lut_slice_del;

architecture rtl of lut_slice_del is

    component dffposx1_del is
        port(
            clk : in std_logic;
            d   : in std_logic;
            q   : out std_logic
        );
    end component;

    component invx1_del is
        port(
            a   : in std_logic;
            x   : out std_logic
        );
    end component;

    component mux2x1_del is
        port(
            b : in std_logic;
            a : in std_logic;
            s : in std_logic;
            x : out std_logic
        );
    end component;

    -- flip flop and mux outputs
    signal ff_o     : std_logic_vector(4 downto 0) := (others => '0');
    signal mux_o    : std_logic_vector(1 downto 0) := (others => '0');
    signal mux_fo   : std_logic_vector(1 downto 0) := (others => '0');
    signal f_muxo   : std_logic := '0';

begin

    -- shifting in from LSB to MSB
    shift_gen_lut : for i in 0 to 3 generate
        ff_lut_i : dffposx1_del
        port map(
            clk => clk_i,
            d   => ff_o(i),
            q   => ff_o(i+1)
        );
    end generate;

    -- lut shift out is output from prev ff
    q <= ff_o(4);
    ff_o(0) <= d;

    -- select first two outputs of LUT
    -- on sel line A
    mux1 : mux2x1_del port map(ff_o(1),  ff_o(2), a, mux_o(0));
    inv1 : invx1_del  port map(mux_o(0), mux_fo(0));

    -- select last two outputs of LUT
    -- on sel line A
    mux2 : mux2x1_del port map(ff_o(3),  ff_o(4), a, mux_o(1));
    inv2 : invx1_del  port map(mux_o(1), mux_fo(1));

    -- select the outputs from
    -- each mux on sel line B
    mux3 : mux2x1_del port map(mux_fo(0), mux_fo(1), b, f_muxo);

    -- invert mux due to func of mux: y = !(S?(A:B))
    inv3 : invx1_del port map(f_muxo, f);

end rtl;
