library ieee;
use ieee.std_logic_1164.all;

entity lut_del is
    generic(
        n       : integer := 2    -- number of levels in tree
   );
    port(
        s_clk   : in std_logic;   -- shift register clock
        l_clk   : in std_logic;   -- lut shift register clock
        s_in    : in std_logic;   -- shift register input (P)
        l_in    : in std_logic;   -- lut shift register input
        t_po    : out std_logic;  -- p_out for test mode
        f_o     : out std_logic;  -- final output of computation
        q_o     : out std_logic   -- final lut shift register output
    );
end lut_del;

architecture rtl of lut_del is

    -- tree diagram for n = 3
    -- row 0 : A
    -- row 1 : BC
    -- row 2 : DEFG
    -- row 3 : shifter

    -- lut connection diagram
    -- l_in -> D -> E -> F -> G -> B -> C -> A

    component dffposx1_del is
        port(
            clk : in std_logic;
            d   : in std_logic;
            q   : out std_logic
        );
    end component;

    component lut_slice_del is
        port(
            clk_i   : in std_logic;
            d       : in std_logic;
            a       : in std_logic;
            b       : in std_logic;
            q       : out std_logic;
            f       : out std_logic
        );
    end component;

    -- carray_array(row, col)
    type carry_array is array (0 to n, 0 to 2**n) of std_logic;
    signal clk_c : carry_array;

    -- carries select outputs of one
    -- row to select inputs of next one
    signal r_c   : carry_array;

    -- carry output of each lut shift
    -- register
    signal l_c   : carry_array;

    -- input shift register carries
    signal s_c   : std_logic_vector(2**n downto 0) := (others => '0');

    --  input shift regstier clock carries
    signal p_clk : std_logic_vector(2**n downto 0) := (others => '0');

begin

    -- generate the input shift register
    shift_gen : for i in 0 to (2**n)-1 generate
        ff_i : dffposx1_del
        port map(
            clk => s_clk,
            d   => s_c(i),
            q   => s_c(i+1)
        );
    end generate shift_gen;

    -- generate the tree
    level_gen : for level in 0 to n-1 generate
        lut_gen : for i in 0 to (2**level)-1 generate
            lut_i : lut_slice_del
            port map(
                clk_i => l_clk,
                d     => l_c(level, i),
                q     => l_c(level, i+1),
                a     => r_c(level+1, i*2),
                b     => r_c(level+1, i*2+1),
                f     => r_c(level, i)
             );
        end generate;
    end generate;

    -- output the value of our function
    q_o <= l_c(0, 1);
    f_o <= r_c(0, 0);

    -- connect each row of LUTs together
    -- first slice in row i connects to
    -- last slice in row i+1
    lut_connect : for level in 0 to n-2 generate
        l_c(level, 0) <= l_c(level+1, (2**(level+1)));
    end generate;

    -- connect input shift register to bottom row of slices
    shift_connect : for i in 0 to (2**n)-1 generate
        r_c(n, i) <= s_c(i+1);
    end generate;

    -- connect input to shift register
    s_c(0) <= s_in;

    -- connect input to first lut (bottom row)
    l_c(n-1, 0) <= l_in;

    -- use last slice of P shift register
    -- feed it into LUT input for test mode
    t_po <= s_c(2**n);

end rtl;
