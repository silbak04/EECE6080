library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lut_slice is
    generic(
        bit_w : integer := 4
    );
    port(
        clk : in std_logic;
        di  : in std_logic;
        a   : in std_logic;
        b   : in std_logic;
        q   : out std_logic_vector(bit_w-1 downto 0);
        fo  : out std_logic
    );
end lut_slice;

architecture rtl of lut_slice is

    signal qo : std_logic_vector(bit_w-1 downto 0) := (others => '0');

    signal f1 : std_logic := '0';
    signal f2 : std_logic := '0';

begin

    -- load data into register
    -- then shift to the right 1
    process(clk, di) begin
        if rising_edge(clk) then
            qo(bit_w-1) <= di;
            qo(bit_w-2 downto 0) <= qo(bit_w-1 downto 1);
        end if;
    end process;

    q <= qo;

    -- select first two outputs of LUT
    -- on sel line A
    f1 <= qo(3) when (a = '0') else
          qo(2) when (a = '1');

    -- select last two outputs of LUT
    -- on sel line A
    f2 <= qo(1) when (a = '0') else
          qo(0) when (a = '1');

    -- select last two outputs from
    -- each mux on sel line B
    fo <= f1    when (b = '0') else
          f2    when (b = '1');

end rtl;
