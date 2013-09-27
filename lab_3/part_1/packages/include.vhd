library ieee;
library std;

use std.textio.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

package headers is

    constant BIT_WIDTH : integer := 8;

    shared variable display : line;
    alias swrite is write [line, string, side, width];

    subtype slv is std_logic_vector;

    function FUN(
                 n : integer;
                 a : std_logic_vector;
                 b : std_logic_vector
             )
             return std_logic_vector;

end package;

package body headers is

    function FUN(
                 n : integer;
                 a : std_logic_vector;
                 b : std_logic_vector
            )
            return std_logic_vector is

    variable c     : std_logic_vector(n-1 downto 0);

    begin

        if(unsigned(a) < unsigned(b)) then
            c := a;
        else
            c := b;
        end if;

        return c;
    end function;

end package body;
