library ieee;
use ieee.std_logic_1164.all;

entity invx1_del is
    generic(
       delay : time := 162.7 ps
   );
    port(
        a : in std_logic;
        x : out std_logic
    );
end invx1_del;

architecture rtl of invx1_del is begin
    x <= not a after delay;
end rtl;
