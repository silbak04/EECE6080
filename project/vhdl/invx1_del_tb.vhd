library ieee;
use ieee.std_logic_1164.all;

entity invx1_del_tb is
end invx1_del_tb;

architecture behavior of invx1_del_tb is

    signal a : std_logic := '1';
    signal x : std_logic;

    component invx1_del is
        generic(
           delay : time := 162.7 ps
       );
        port(
            a : in std_logic;
            x : out std_logic
        );
    end component;

begin

    dut : invx1_del
    port map(
        a => a,
        x => x
    );

    process begin
        wait for 10 ns;
        a <= '0';
        wait for 10 ns;
        a <= '1';
    end process;

end behavior;
