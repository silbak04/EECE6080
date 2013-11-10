library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use work.txt_util.all;

entity top_test_tb is
end top_test_tb;

architecture behavior of top_test_tb is

    constant n : integer := 5;

    component top
        generic(
           n      : integer := 3    -- number of levels in tree
       );
        port(
            p_clk : in std_logic;   -- p shift register clock
            l_clk : in std_logic;   -- lut shift register clock
            p_in  : in std_logic;   -- shift register input (P)
            l_in  : in std_logic;   -- lut shift register input
            t_en  : in std_logic;   -- test enalbe input
            f_o   : out std_logic;  -- final output of computation
            q_o   : out std_logic   -- lut shift register output
        );
    end component;

    signal p_clk : std_logic := '0';
    signal l_clk : std_logic := '0';
    signal p     : std_logic := '0';
    signal l_in  : std_logic := '0';
    signal f_o   : std_logic;
    signal q_o   : std_logic;
    signal t_en  : std_logic := '0';

begin

    dut : top
    generic map(
        n     => n
    )
    port map(
        p_clk => p_clk,
        l_clk => l_clk,
        p_in  => p,
        l_in  => l_in,
        t_en  => t_en,
        f_o   => f_o,
        q_o   => q_o
    );

    process

        procedure clk is begin
            p_clk <= '1';
            wait for 10 ns;
            p_clk <= '0';
            wait for 10 ns;
        end procedure clk;

    begin

        wait for 10 ns;
        -- enable test mode
        t_en <= '1';

        -- clock in p data
        p <= '1';
        wait for 10 ns;
        clk;

        -- clock in p data
        p <= '0';
        wait for 10 ns;
        clk;

        -- # of FF's per LUT: 4
        -- # of LUT FF's    : (((2**n)-1)*4)
        -- # of P FF's      : 2**n
        -- subtract 2 since we just loaded in two inputs
        for i in 0 to ((((2**n)-1)*4)+2**n)-2-1 loop
            clk;
        end loop;

        wait;

    end process;

end behavior;
