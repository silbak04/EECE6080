* Samir Silbak
* M03321037

.include /home/silbaksr/vlsi/models/library.sp

**********************
*   Design Circuit   *
**********************

* N-NAND
Xnnand clk a b f vdd gnd nnand

**********************
*    Design Simul    *
**********************

V_dd vdd gnd 5V

.param s = 1

v1 a    gnd PWL(0n 0v '9.9n*s' 0v '10n*s' 5v '34.9n*s' 5v '35n*s' 0v '49.9n*s' 0v '50n*s' 5v '54.9n*s' 5v '55n*s' 0v)
v2 b    gnd PWL(0n 0v '9.9n*s' 0v '10n*s' 5v '34.9n*s' 5v '35n*s' 0v '49.9n*s' 0v '50n*s' 5v '54.9n*s' 5v '55n*s' 0v)

v4 clk  gnd PULSE(0v 5v 15n 0n 0n 15n 30n)

.options post
.tran 0.01n '75n*s'

.meas tran t_rise trig v(f) val=0.5V rise=1 targ v(f) val=4.5V rise=1
.meas tran t_fall trig v(f) val=4.5V fall=1 targ v(f) val=0.5V fall=1
.meas t_d param='(t_rise+t_fall)/2'

.end
