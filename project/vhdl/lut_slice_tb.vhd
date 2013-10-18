library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lut_slice_tb is
end lut_slice_tb;

architecture behavior of lut_slice_tb is

    constant bit_w : integer := 4;

    signal clk  : std_logic;
    signal di   : std_logic;
    signal a    : std_logic;
    signal b    : std_logic;
    signal q    : std_logic_vector(bit_w-1 downto 0);
    signal fo   : std_logic;

    component lut_slice
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
    end component;

begin

    -- lut for AND gate
    process begin
        clk <= '0';
        di  <= '0';
        a   <= '1';
        b   <= '1';
        wait for 10 ns;

        clk <= '1';
        di  <= '1';
        wait for 10 ns;

        clk <= '0';
        wait for 10 ns;

        clk <= '1';
        di  <= '0';
        wait for 10 ns;

        clk <= '0';
        wait for 10 ns;

        clk <= '1';
        di  <= '0';
        wait for 10 ns;

        clk <= '0';
        wait for 10 ns;

        clk <= '1';
        di  <= '0';
        wait for 10 ns;
    end process;

    lut : lut_slice
    generic map(
        bit_w => bit_w
    )
    port map(
        clk => clk,
        di  => di,
        a   => a,
        b   => b,
        q   => q,
        fo  => fo
    );

end behavior;
