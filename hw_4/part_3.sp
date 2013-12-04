* Samir Silbak - part_3
* M03321037

.include /home/silbaksr/vlsi/models/library.sp

**********************
*   Design Circuit   *
**********************

Xcarry0 clk_p clk_n p0 g0 ci0 co0 vdd gnd carry
Xcarry1 clk_p clk_n p1 g1 co0 co1 vdd gnd carry
Xcarry2 clk_p clk_n p2 g2 co1 co2 vdd gnd carry
Xcarry3 clk_p clk_n p3 g3 co2 co3 vdd gnd carry

**********************
*    Design Simul    *
**********************

V_dd vdd gnd 5V

.param freq = 117Meg

vclk_p  clk_p   gnd PULSE(0V 5V '1/freq/2' 0 0 '1/freq/2' '1/freq')
vclk_n  clk_n   gnd PULSE(5V 0V '1/freq/2' 0 0 '1/freq/2' '1/freq')

vp0         p0      gnd PWL(0n 5V)
vp1         p1      gnd PWL(0n 5V)
vp2         p2      gnd PWL(0n 5V)
vp3         p3      gnd PWL(0n 5V)

vg0         g0      gnd PWL(0n 0V)
vg1         g1      gnd PWL(0n 0V)
vg2         g2      gnd PWL(0n 0V)
vg3         g3      gnd PWL(0n 0V)

vci0        ci0     gnd PWL(0n 0v '0.9n' 0v '1n' 5v '9.9n' 5v '10n' 0v)

.option post
.tran 0.01n '20n'

.meas tran t_rise trig v(co3) val=0.5V rise=1 targ v(co3) val=4.5V rise=1
.meas tran t_fall trig v(co3) val=4.5V fall=1 targ v(co3) val=0.5V fall=1
.meas t_d param='(t_rise+t_fall)/2'

.end
