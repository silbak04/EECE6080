library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use work.txt_util.all;

entity top_del_tb is
    generic(
        --stim_file : string := "test_tree.sim"
        stim_file : string := "two_tree.sim"
    );
end top_del_tb;

architecture behavior of top_tb_del is

    constant n : integer := 2;

    signal p_clk : std_logic := '0';
    signal l_clk : std_logic := '0';
    signal p     : std_logic := '0';
    signal l_in  : std_logic := '0';
    signal f_o   : std_logic;
    signal q_o   : std_logic;
    signal t_en  : std_logic := '0';

    signal p_in_vector : std_logic_vector((2**n)-1         downto 0);
    signal lut_vector  : std_logic_vector((((2**n)-1)*4)-1 downto 0);

    file stimulus : TEXT open read_mode is stim_file;

    component top_del
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

begin

    dut : top_del
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

        procedure clk_p_in is begin
            p_clk <= '1';
            wait for 10 ns;
            p_clk <= '0';
            wait for 10 ns;
        end procedure clk_p_in;

        procedure clk_lut_in is begin
            l_clk <= '1';
            wait for 10 ns;
            l_clk <= '0';
            wait for 10 ns;
        end procedure clk_lut_in;

        variable l: line;
        variable p_in_str : string(1 to 2**n);
        variable l_shf_str: string(1 to ((2**n)-1)*4);

    begin

        while not endfile(stimulus) loop

            -- load stimulus for this test
            readline(stimulus, l); read(l, p_in_str);
            p_in_vector <= to_std_logic_vector(p_in_str);

            readline(stimulus, l); read(l, l_shf_str);
            lut_vector <= to_std_logic_vector(l_shf_str);

            wait for 50 ns;

            -- clock in the P input
            for i in 0 to (2**n)-1 loop
                p <= p_in_vector(i);
                wait for 10 ns;
                clk_p_in;
            end loop;

            -- clock in the "program" (lut functions)
            for i in 0 to (((2**n)-1)*4)-1 loop
                l_in <= lut_vector(i);
                wait for 10 ns;
                clk_lut_in;
            end loop;

        end loop;

        report "Test Complete" severity note;
        wait;

    end process;

end behavior;
