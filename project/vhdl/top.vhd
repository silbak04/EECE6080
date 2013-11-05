library ieee;
use ieee.std_logic_1164.all;

entity top is
    generic(
       n      : integer := 2    -- number of levels in tree
   );
    port(
        p_clk : in std_logic;   -- shift register clock
        l_clk : in std_logic;   -- lut shift register clock
        p_in  : in std_logic;   -- shift register input (P)
        l_in  : in std_logic;   -- lut shift register input
        t_en  : in std_logic;   -- test enalbe input
        f_o   : out std_logic;  -- final output of computation
        q_o   : out std_logic   -- final lut shift register output
    );
end top;

architecture rtl of top is

    signal shift_clki   : std_logic := '0';
    signal shift_clk    : std_logic := '0';
    signal l_shf_ini    : std_logic := '0';
    signal l_shf_in     : std_logic := '0';
    signal p_out        : std_logic := '0';

begin

    -- test mux connects output of P into input of LUT and use same clock line
    t_mux_1 : entity work.mux2x1 port map(l_clk, p_clk, t_en, shift_clki);
    t_mux_2 : entity work.mux2x1 port map(l_in,  p_out, t_en, l_shf_ini);

    t_inv_1 : entity work.invx1  port map(shift_clki, shift_clk);
    t_inv_2 : entity work.invx1  port map(l_shf_ini, l_shf_in);

    lut_1 : entity work.lut
    port map(
        s_clk   => p_clk,
        l_clk   => shift_clk,
        s_in    => p_in,
        l_in    => l_shf_in,
        t_po    => p_out,
        f_o     => f_o,
        q_o     => q_o
    );

end rtl;
