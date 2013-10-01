library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
    generic(
        BIT_WIDTH : integer := 3
    );
    port(
        a : in std_logic_vector(BIT_WIDTH-1 downto 0);
        b : in std_logic_vector(BIT_WIDTH-1 downto 0);
        c : out std_logic_vector(BIT_WIDTH-1 downto 0)
    );
end entity top;

architecture rtl of top is

    -- carry in
    signal c_i : std_logic_vector(BIT_WIDTH   downto 0) := (others => '0');
    signal min : std_logic_vector(BIT_WIDTH-1 downto 0) := (others => '0');

begin

    b_width : for n in 0 to (BIT_WIDTH-1) generate
        b1 : entity work.bit_slice
        port map(
            a   => a(n),
            b   => b(n),
            q_i => c_i(n),
            q_o => c_i(n+1),
            sel => c_i(BIT_WIDTH),
            min => c(n)
        );
    end generate b_width;

end rtl;
