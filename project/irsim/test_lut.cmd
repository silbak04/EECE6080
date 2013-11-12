stepsize 10
logfile test.log
h VDD
l GND
vector T_CLK TSCI
w   TSCI TSLI TSA TSB TSLO TSF
ana TSCI TSLI TSA TSB TSLO TSF
l TMEI
clock TSCI 0 1
h TSLI
c
h TSLI
c
h TSLI
c
h TSLI
c
clock TSCI 0 0
clock TSCI 0 1
h TSA
h TSB
c
clock TSCI 0 0
