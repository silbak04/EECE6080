stepsize 10
logfile test_tree.log
h VDD
l GND
vector P_CLK PCLKI
vector L_CLK LCLKI
w   PCLKI LCLKI P_IN L_IN L_OUT P_OUT F
ana PCLKI LCLKI P_IN L_IN L_OUT P_OUT F
l TMEI
clock L_CLK 0 1
h L_IN
c
l L_IN
c
l L_IN
c
l L_IN
c
h L_IN
c
l L_IN
c
l L_IN
c
l L_IN
c
h L_IN
c
l L_IN
c
l L_IN
c
l L_IN
c
h L_IN
c
l L_IN
c
l L_IN
c
l L_IN
c
h L_IN
c
l L_IN
c
l L_IN
c
l L_IN
c
h L_IN
c
l L_IN
c
l L_IN
c
l L_IN
c
h L_IN
c
l L_IN
c
l L_IN
c
l L_IN
c
clock L_CLK 0 0
clock P_CLK 0 1
h P_IN
c
h P_IN
c
h P_IN
c
h P_IN
c
h P_IN
c
h P_IN
c
h P_IN
c
h P_IN
c
clock P_CLK 0 0
