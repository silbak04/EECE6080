library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lut_slice_tb is
end lut_slice_tb;

architecture behavior of lut_slice_tb is

    signal clk      : std_logic := '0';
    signal clk_o    : std_logic;
    signal di       : std_logic := '0';
    signal a        : std_logic := '0';
    signal b        : std_logic := '0';
    signal q        : std_logic;
    signal f        : std_logic;

    component lut_slice
        port(
            clk_i   : in std_logic;
            clk_o   : out std_logic;
            d       : in std_logic;
            a       : in std_logic;
            b       : in std_logic;
            q       : out std_logic;
            f       : out std_logic
        );
    end component;

begin

    dut : lut_slice
    port map(
        clk_i   => clk,
        clk_o   => clk_o,
        d       => di,
        a       => a,
        b       => b,
        q       => q,
        f       => f
    );

    process

        procedure clock is begin
            clk <= '1';
            wait for 10 ns;
            clk <= '0';
            wait for 10 ns;
        end procedure clock;

    begin

        wait for 10 ns;
        a   <= '1';
        b   <= '1';

        -- lut for AND gate
        di <= '1';
        wait for 10 ns;
        clock;

        di  <= '0';
        wait for 10 ns;
        clock;

        di  <= '0';
        wait for 10 ns;
        clock;

        di  <= '0';
        wait for 10 ns;
        clock;

        wait;

    end process;

end behavior;
