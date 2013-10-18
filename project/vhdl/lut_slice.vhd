library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lut_slice is
    generic(
        delay : integer := 0 ps;
        bit_w : integer := 4
    );
    port(
        a       : in std_logic;
        b       : in std_logic;
        d_in    : in std_logic;
        clk     : in std_logic
    );
end entity lut_slice;

architecture rtl of lut_slice is

    signal q : std_logic_vector(bit_w-1 downto 0) := (others => '0');

    signal f1 : std_logic := '0';
    signal f2 : std_logic := '0';
    signal f3 : std_logic := '0';

begin

    process(clk, d_in) begin
        if rising_edge(clk) then
            q <= (d_in sll 1);
        end if;
    end process;

    f1 <= q(0) when (a = '0') else
          q(1) when (a = '1');

    f2 <= q(2) when (a = '0') else
          q(3) when (a = '1');

    f3 <= f1   when (b = '0') else
          f2   when (b = '1');

end rtl;
