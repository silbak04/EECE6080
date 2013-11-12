stepsize 10
logfile test_dff.log
h VDD
l GND
vector T_CLK TFCI
w   TFCI TFDI TFQO
ana TFCI TFDI TFQO
clock T_CLK 0 1
h TFDI
c
clock T_CLK 0 0
