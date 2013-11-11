stepsize 10

h VDD
l GND

vector L_CLK LCLKI
clock L_CLK 0 1

w   TMEI LCLKI L_IN LO_0 LO_1 LO_2 LO_3 L_OUT Q1 Q2 Q3 Q4 Q5 q6 q7 q8 q9 q10 q11 q12 q13 q14 q15
ana TMEI LCLKI L_IN LO_0 LO_1 LO_2 LO_3 L_OUT Q1 Q2 Q3 Q4 Q5 q6 q7 q8 q9 q10 q11 q12 q13 q14 q15

l TMEI

l L_IN
c

h L_IN
c

l L_IN
c

c 13

assert LO_0 0
c

assert LO_0 1
c

assert LO_0 0
c

c 13

assert LO_1 0
c

assert LO_1 1
c

assert LO_1 0
c

c 13

assert LO_2 0
c

assert LO_2 1
c

assert LO_2 0
c

c 13

assert LO_3 0
c

assert LO_3 1
c

assert LO_3 0
c
