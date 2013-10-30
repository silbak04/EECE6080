library ieee;
use ieee.std_logic_1164.all;

entity mux2x1_tb is
end mux2x1_tb;

architecture behavior of mux2x1_tb is

    signal a : std_logic := '0';
    signal b : std_logic := '0';
    signal s : std_logic := '0';
    signal x : std_logic;

    component mux2x1_del is
        generic(
            delay : time := 315 ps
        );
        port(
            a : in std_logic;
            b : in std_logic;
            s : in std_logic;
            x : out std_logic
        );
    end component;

begin

    dut : mux2x1_del
    port map(
        b => a,
        a => b,
        s => s,
        x => x
    );

    process begin
        a <= '0'; b <= '0'; s <= '0';
        wait for 10 ns;
        a <= '0'; b <= '1'; s <= '1';
        wait for 10 ns;
        a <= '0'; b <= '0'; s <= '0';
        wait for 10 ns;
        a <= '0'; b <= '1'; s <= '1';
        wait for 10 ns;
        a <= '1'; b <= '0'; s <= '0';
        wait for 10 ns;
        a <= '1'; b <= '1'; s <= '1';
        wait for 10 ns;
        a <= '1'; b <= '0'; s <= '0';
        wait for 10 ns;
        a <= '1'; b <= '1'; s <= '1';
        wait for 10 ns;
    end process;

end behavior;
