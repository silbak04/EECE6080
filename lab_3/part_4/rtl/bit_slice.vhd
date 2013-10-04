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

architecture rtl of bit_slice is

    signal inverted_o_cmp   : std_logic;
    signal inverted_o_mux   : std_logic;

    signal f1_cmp_o         : std_logic;
    signal f2_cmp_o         : std_logic;
    signal f3_cmp_o         : std_logic;

    signal f1_mux_o         : std_logic;
    signal f2_mux_o         : std_logic;
    signal f3_mux_o         : std_logic;
    signal f4_mux_o         : std_logic;

begin

    -- first stage of comparator
    nand_g1_cmp : entity work.two_in_nand_gate
    port map(
        a => inverted_o_cmp,
        b => q_i,
        f => f1_cmp_o
    );

    -- second stage of comparator
    nand_g2_cmp : entity work.two_in_nand_gate
    port map(
        a => inverted_o_cmp,
        b => b,
        f => f2_cmp_o
    );

    -- third stage of comparator
    nand_g3_cmp : entity work.two_in_nand_gate
    port map(
        a => q_i,
        b => b,
        f => f3_cmp_o
    );

    -- fourth stage of comparator
    nand_g4_cmp : entity work.three_in_nand_gate
    port map(
        a => f1_cmp_o,
        b => f2_cmp_o,
        c => f3_cmp_o,
        f => q_o
    );

    -- first stage of mux
    nand_g1_mux : entity work.two_in_nand_gate
    port map(
        a => inverted_o_mux,
        b => b,
        f => f1_mux_o
    );

    -- second stage of mux
    nand_g2_mux : entity work.two_in_nand_gate
    port map(
        a => a,
        b => sel,
        f => f2_mux_o
    );

    -- third stage of mux
    nand_g3_mux : entity work.two_in_nand_gate
    port map(
        a => f1_mux_o,
        b => f2_mux_o,
        f => min
    );

    not_g1_cmp : entity work.not_gate
    port map(
        a => a,
        f => inverted_o_cmp
    );

    not_g1_mux : entity work.not_gate
    port map(
        a => sel,
        f => inverted_o_mux
    );

end rtl;
