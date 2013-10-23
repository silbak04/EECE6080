library ieee;
use ieee.std_logic_1164.all;

entity top is
    generic(
       n      : integer := 3    -- number of levels in tree
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

    signal shift_clk : std_logic := '0';
    signal p_shf_out : std_logic := '0';
    signal l_shf_in  : std_logic := '0';
    signal p_out     : std_logic := '0';

begin

    -- test mux connects output of P into input of LUT
    -- and use same clk line
    t_mux_1 : entity work.mux2x1 port map(l_clk, p_clk,     t_en, shift_clk);
    t_mux_2 : entity work.mux2x1 port map(p_in,  p_out,     t_en, p_shf_out);
    t_mux_3 : entity work.mux2x1 port map(l_in,  p_shf_out, t_en, l_shf_in);

    lut_1 : entity work.lut
    port map(
        s_clk   => p_clk,
        l_clk   => shift_clk,
        s_in    => p_shf_out,
        l_in    => l_shf_in,
        t_en    => t_en,
        t_po    => p_out,
        f_o     => f_o,
        q_o     => q_o
    );

end rtl;
