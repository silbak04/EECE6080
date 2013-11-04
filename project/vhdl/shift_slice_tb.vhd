library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_slice_tb is
end shift_slice_tb;

architecture behavior of shift_slice_tb is

    -- input shift register carries
    --signal s_c   : std_logic_vector(2**n downto 0);

    ----  input shift regstier clock carries
    --signal p_clk : std_logic_vector(2**n downto 0);

    signal clk  : std_logic := '0';
    signal clko : std_logic;
    signal p    : std_logic := '0';
    signal q    : std_logic;

    component shift_slice is
        port(
            clk_i   : in std_logic;
            p       : in std_logic;
            clk_o   : out std_logic;
            q       : out std_logic
        );
    end component;

begin

    dut : shift_slice
    port map(
        clk_i   => clk,
        clk_o   => clko,
        p       => p,
        q       => q
    );

    process

        procedure clock is begin
            clk <= '1';
            wait for 10 ns;
            clk <= '0';
            wait for 10 ns;
        end procedure clock;

    begin

        wait for 10 ns;

        p <= '1';
        wait for 10 ns;
        clock;

        p <= '0';
        wait for 10 ns;
        clock;

        p <= '1';
        wait for 10 ns;
        clock;

        for i in 0 to 7 loop
            clock;
        end loop;

        wait;

    end process;

end behavior;
