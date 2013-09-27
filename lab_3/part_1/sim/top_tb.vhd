library ieee;
library std;

use std.textio.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

use work.headers.all;

entity top_tb is
end top_tb;

architecture behavior of top_tb is

    signal a    : std_logic_vector(BIT_WIDTH-1 downto 0) := (others => '0');
    signal b    : std_logic_vector(BIT_WIDTH-1 downto 0) := (others => '0');
    signal c    : std_logic_vector(BIT_WIDTH-1 downto 0) := (others => '0');

    component top
        port(
            a   : in std_logic_vector(BIT_WIDTH-1 downto 0);
            b   : in std_logic_vector(BIT_WIDTH-1 downto 0);
            c   : out std_logic_vector(BIT_WIDTH-1 downto 0)
        );
    end component;

begin

    process begin
        for i in 0 to ((2**BIT_WIDTH)/2)-1 loop
            swrite(display, "[0x");
            hwrite(display, slv(to_unsigned(i, BIT_WIDTH)));
            swrite(display, "] ");

            swrite(display, "a = 0x");
            hwrite(display, a);
            swrite(display, " | ");

            swrite(display, "b = 0x");
            hwrite(display, b);
            swrite(display, " | ");

            swrite(display, "c = 0x");
            hwrite(display, c);

            writeline(output, display);

            a <= slv(unsigned(a) + 1);
            b <= slv(unsigned(b) + 2);

            -- set run length in quartus to 10 ns
            wait for 1 ps;
        end loop;
        wait;
    end process;

    min_1 : top
        port map(
            a => a,
            b => b,
            c => c
        );

end behavior;
