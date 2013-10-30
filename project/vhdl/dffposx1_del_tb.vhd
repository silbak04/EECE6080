library ieee;
use ieee.std_logic_1164.all;

entity dffposx1_del_tb is
end dffposx1_del_tb;

architecture behavior of dffposx1_del_tb is

    signal clk  : std_logic := '0';
    signal d    : std_logic := '0';
    signal q    : std_logic;

    component dffposx1_del is
        generic(
            delay : time := 203.5 ps
        );
        port(
            clk : in std_logic;
            d   : in std_logic;
            q   : out std_logic
        );
    end component;

begin

    dut : dffposx1_del
    port map(
        clk => clk,
        d   => d,
        q   => q
    );

    process begin
        wait for 10 ns;
        d <= '1';
        wait for 10 ns;
        clk <= '1';
    end process;

end behavior;
