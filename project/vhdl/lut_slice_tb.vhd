library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lut_slice_tb is
end lut_slice_tb;

architecture behavior of lut_slice_tb is

    signal clk      : std_logic;
    signal clk_o    : std_logic;
    signal di       : std_logic;
    signal a        : std_logic;
    signal b        : std_logic;
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

    -- lut for AND gate
    process begin
        clk <= '0';
        di  <= '0';
        a   <= '1';
        b   <= '1';
        wait for 10 ns;

        clk <= '1';
        di  <= '1';
        wait for 10 ns;

        clk <= '0';
        wait for 10 ns;

        clk <= '1';
        di  <= '0';
        wait for 10 ns;

        clk <= '0';
        wait for 10 ns;

        clk <= '1';
        di  <= '0';
        wait for 10 ns;

        clk <= '0';
        wait for 10 ns;

        clk <= '1';
        di  <= '0';
        wait for 10 ns;
    end process;

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

end behavior;
