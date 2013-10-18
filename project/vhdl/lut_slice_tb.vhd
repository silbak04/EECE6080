library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lut_slice_tb is
end lut_slice_tb;

architecture behavior of lut_slice_tb is

    component lut_slice
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
