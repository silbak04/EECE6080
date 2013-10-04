stepsize 1000

logfile irsim_f.log

h VDD
l GND

l A B C_IN SEL
vector in A B C_IN SEL
ana A B C_IN SEL C_OUT MUX_OUT
w A B C_IN SEL C_OUT MUX_OUT

setvector in 0000
s
path C_OUT
setvector in 0001
s
path C_OUT
setvector in 0010
s
path C_OUT
setvector in 0011
s
path C_OUT
setvector in 0100
s
path C_OUT
setvector in 0101
s
path C_OUT
setvector in 0110
s
path C_OUT
setvector in 0111
s
path C_OUT
setvector in 1000
s
path C_OUT
setvector in 1001
s
path C_OUT
setvector in 1010
s
path C_OUT
setvector in 1011
s
path C_OUT
setvector in 1100
s
path C_OUT
setvector in 1101
s
path C_OUT
setvector in 1110
s
path C_OUT
setvector in 1111
s
path C_OUT
