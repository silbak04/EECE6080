library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.headers.all;

entity top is
    port(
        a : in std_logic_vector(BIT_WIDTH-1 downto 0) := (others => '0');
        b : in std_logic_vector(BIT_WIDTH-1 downto 0) := (others => '0');
        c : out std_logic_vector(BIT_WIDTH-1 downto 0) := (others => '0')
    );
end top;

architecture rtl of top is

signal min : std_logic_vector(BIT_WIDTH-1 downto 0) := (others => '0');

begin

    process(a, b, min) begin
        min <= FUN(BIT_WIDTH, a, b);
    end process;

    c <= min;

end rtl;
