* Samir Silbak - part_2
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

.param freq = 381.2Meg
*.param freq = 200Meg

vclk_p  clk_p   gnd PULSE(0V 5V '1/freq/2' 0 0 '1/freq/2' '1/freq')
vclk_n  clk_n   gnd PULSE(5V 0V '1/freq/2' 0 0 '1/freq/2' '1/freq')

vp      p       gnd PWL(0n 5V)
vg      g       gnd PWL(0n 0V)
vci     ci      gnd PWL(0n 0v '7.9n' 0v '8n' 5v '11.9n' 5v '12n' 0v)

.option post
.tran 0.01n '20n'

.meas tran t_rise trig v(co) val=0.5V rise=1 targ v(co) val=4.5V rise=1
.meas tran t_fall trig v(co) val=4.5V fall=1 targ v(co) val=0.5V fall=1
.meas t_d param='(t_rise+t_fall)/2'

.end
