library ieee;
use ieee.std_logic_1164.all;

entity lut_tb is
end lut_tb;

architecture behavior of lut_tb is

    constant n : integer := 3;

    component lut is
        generic(
           n      : integer := 3    -- number of levels in tree
       );
        port(
            s_clk : in std_logic;   -- shift register clock
            l_clk : in std_logic;   -- lut shift register clock
            s_in  : in std_logic;   -- shift register input (P)
            l_in  : in std_logic;   -- lut shift register input
            t_po  : out std_logic;  -- p_out for test mode
            t_co  : out std_logic;  -- p_clk for test mode
            f_o   : out std_logic;  -- final output of computation
            q_o   : out std_logic   -- final lut shift register output
        );
    end component;

    signal s_clk    : std_logic;
    signal l_clk    : std_logic;
    signal s_in     : std_logic;
    signal l_in     : std_logic;
    signal t_po     : std_logic;
    signal t_co     : std_logic;
    signal q_o      : std_logic;

begin

    dut : lut
    generic map(
        n => n
    )
    port map(
        s_clk => s_clk,
        l_clk => l_clk,
        s_in  => s_in,
        l_in  => l_in,
        t_po  => t_po,
        t_co  => t_co,
        --f_o   => f_o,
        q_o   => q_o
    );

end behavior;
