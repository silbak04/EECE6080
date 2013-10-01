library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bit_slice is
    port(
        a   : in std_logic;
        b   : in std_logic;

        q_i : in std_logic;
        q_o : out std_logic;

        sel : in std_logic;
        min : out std_logic
    );
end bit_slice;

architecture rtl of bit_slice is

    signal carry_out : std_logic := '0';

begin

    -- comparator
    process(a, b, q_i, carry_out) begin
        if (a = '0' and b = '1') then
            carry_out <= '1';
        elsif (a = '1' and b = '0') then
            carry_out <= '0';
        else
            carry_out <= q_i;
        end if;
    end process;

    q_o <= carry_out;

    min <= a when (sel = '1') else
           b when (sel = '0');

end rtl;
