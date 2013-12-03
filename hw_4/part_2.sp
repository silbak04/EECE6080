* Samir Silbak
* M03321037

.include /home/silbaksr/vlsi/models/library.sp

**********************
*   Design Circuit   *
**********************

Xcarry clk_p clk_n p g ci co vdd gnd carry

**********************
*    Design Simul    *
**********************

V_dd vdd gnd 5V

*.param s = 0.0753
.param s = 1

vclk_p  clk_p   gnd PULSE(0V 5V '15n*s' 0 0 '15n*s' '30n*s')
vclk_n  clk_n   gnd PULSE(5V 0V '15n*s' 0 0 '15n*s' '30n*s')

vp      p       gnd PWL(0n 5V)
*vg      g       gnd PWL(0n 5V)
vg      g       gnd PWL(0n 0V)
vci     ci      gnd PWL(0n 0V '9.9n*s' 0V '10n*s' 5V '34.9n*s' 5V '35n*s' 0V '49.9n*s' 0V '50n*s' 5V '54.9n*s' 5V '55n*s' 0v)

.option post
.tran 0.01n '75n*s'

.meas tran t_rise trig v(co) val=0.5V rise=1 targ v(co) val=4.5V rise=1
.meas tran t_fall trig v(co) val=4.5V fall=1 targ v(co) val=0.5V fall=1
.meas t_d param='(t_rise+t_fall)/2'

.end
