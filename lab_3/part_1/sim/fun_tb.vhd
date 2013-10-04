library ieee;
library std;

use std.textio.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

entity fun_tb is
end fun_tb;

architecture behavior of fun_tb is

    constant BIT_WIDTH : integer := 3;

    signal a : std_logic_vector(BIT_WIDTH-1 downto 0) := (others => '0');
    signal b : std_logic_vector(BIT_WIDTH-1 downto 0) := (others => '0');
    signal c : std_logic_vector(BIT_WIDTH-1 downto 0) := (others => '0');

    shared variable display : line;
    alias swrite is write [line, string, side, width];

    subtype slv is std_logic_vector;

    component FUN
        generic(
            BIT_WIDTH : integer
        );
        port(
            a : in std_logic_vector(BIT_WIDTH-1 downto 0);
            b : in std_logic_vector(BIT_WIDTH-1 downto 0);
            c : out std_logic_vector(BIT_WIDTH-1 downto 0)
        );
    end component;

begin

    process begin
        for i in 0 to (2**BIT_WIDTH)-1 loop
            for j in 0 to (2**BIT_WIDTH)-1 loop
                swrite(display, "[i = 0x");
                hwrite(display, slv(to_unsigned(i, BIT_WIDTH)));
                swrite(display, "] ");

                swrite(display, "[j = 0x");
                hwrite(display, slv(to_unsigned(j, BIT_WIDTH)));
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

                a <= slv(unsigned(a) + i);
                b <= slv(unsigned(b) + j);

                wait for 8 ns;
            end loop;
        end loop;
        wait;
    end process;

    min_3bit : FUN
        generic map(
            BIT_WIDTH => 3
        )
        port map(
            a => a,
            b => b,
            c => c
        );

end behavior;
