* Samir Silbak - part_1_inv
* M03321037

.include /home/silbaksr/vlsi/models/library.sp

**********************
*   Design Circuit   *
**********************

* Inverter
Xinv a f vdd gnd inv

**********************
*    Design Simul    *
**********************

V_dd vdd gnd 5V

.param s = 1

v1 a  gnd PWL(0n 0v '9.9n*s' 0v '10n*s' 5v '19.9n*s' 5v '20n*s' 0v)

.options post
.tran 0.01n 30n

.meas tran t_rise trig v(f) val=0.5V rise=1 targ v(f) val=4.5V rise=1
.meas tran t_fall trig v(f) val=4.5V fall=1 targ v(f) val=0.5V fall=1
.meas t_d param='(t_rise+t_fall)/2'

.end
