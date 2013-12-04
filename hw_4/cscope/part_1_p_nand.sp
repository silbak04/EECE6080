* Samir Silbak - part_1_p_nand
* M03321037

.include /home/silbaksr/vlsi/models/library.sp

**********************
*   Design Circuit   *
**********************

* P-NAND
Xpnand clk a b f vdd gnd pnand

**********************
*    Design Simul    *
**********************

V_dd vdd gnd 5V

*.param freq = 200Meg
.param freq = 531.91Meg

va a    gnd PWL(0n 5v '9.9n' 5v '10n' 0v '11.9n' 0v '12n' 5v)
vb b    gnd PWL(0n 5v '9.9n' 5v '10n' 0v '11.9n' 0v '12n' 5v)

v3 clk  gnd PULSE(5V 0V '1/freq/2' 0 0 '1/freq/2' '1/freq')

.options post
.tran 0.01n '20n'

.meas tran t_rise trig v(f) val=0.5V rise=1 targ v(f) val=4.5V rise=1
.meas tran t_fall trig v(f) val=4.5V fall=1 targ v(f) val=0.5V fall=1
.meas t_d param='(t_rise+t_fall)/2'

.end
