* Samir Silbak
* M03321037
* HW1 - P1

* hspice subcircuit dictionary
.include /home/silbaksr/vlsi/models/model_t36s.sp

**********************
*   Design Circuit   *
**********************

.param w_nmos = 0.9u
.param w_pmos = 0.9u
.param length = 0.6u
.param l_diff = 2u

* 2-INPUT N-NAND GATE
mpmos_1 vdd clk f1      vdd pfet w=w_pmos l=length
+ ad=(w_pmos*l_diff) pd=(2*l_diff+2*w_pmos)
+ as=(w_pmos*l_diff) ps=(2*l_diff+2*w_pmos)

mnmos_2 f1  p   t_23    gnd nfet w=w_nmos l=length
+ ad=(w_nmos*l_diff) pd=(2*l_diff+2*w_nmos)
+ as=(w_nmos*l_diff) ps=(2*l_diff+2*w_nmos)

mnmos_3 t_23 ci  t_34   gnd nfet w=w_nmos l=length
+ ad=(w_nmos*l_diff) pd=(2*l_diff+2*w_nmos)
+ as=(w_nmos*l_diff) ps=(2*l_diff+2*w_nmos)

mnmos_4 t_34 clk gnd    gnd nfet w=w_nmos l=length
+ ad=(w_nmos*l_diff) pd=(2*l_diff+2*w_nmos)
+ as=(w_nmos*l_diff) ps=(2*l_diff+2*w_nmos)

* Inverter
mpmos_2 vdd g f2        vdd pfet w=w_pmos l=length
+ ad=(w_pmos*l_diff) pd=(2*l_diff+2*w_pmos)
+ as=(w_pmos*l_diff) ps=(2*l_diff+2*w_pmos)

mnmos_5 f2  g gnd       gnd nfet w=w_nmos l=length
+ ad=(w_nmos*l_diff) pd=(2*l_diff+2*w_nmos)
+ as=(w_nmos*l_diff) ps=(2*l_diff+2*w_nmos)

* 2-INPUT P-NAND GATE
mpmos_3 vdd clk  t_56   vdd pfet w=w_pmos l=length
+ ad=(w_pmos*l_diff) pd=(2*l_diff+2*w_pmos)
+ as=(w_pmos*l_diff) ps=(2*l_diff+2*w_pmos)

mpmos_4 t_56 f2  co     vdd pfet w=w_pmos l=length
+ ad=(w_pmos*l_diff) pd=(2*l_diff+2*w_pmos)
+ as=(w_pmos*l_diff) ps=(2*l_diff+2*w_pmos)

mpmos_5 t_56 f1  co     vdd pfet w=w_pmos l=length
+ ad=(w_pmos*l_diff) pd=(2*l_diff+2*w_pmos)
+ as=(w_pmos*l_diff) ps=(2*l_diff+2*w_pmos)

mnmos_6 co   clk gnd    gnd nfet w=w_nmos l=length
+ ad=(w_nmos*l_diff) pd=(2*l_diff+2*w_nmos)
+ as=(w_nmos*l_diff) ps=(2*l_diff+2*w_nmos)

**********************
*    Design Simul    *
**********************

V_dd vdd gnd 5V

*v1 p  gnd PWL(0n 0v 9.9n 0v 10n 5v 34.9n 5v 35n 0v 49.9n 0v 50n 5v 54.9n 5v 55n 0v)
v1 p  gnd PWL(0n 5v)
*v2 g  gnd PWL(0n 0v 9.9n 0v 10n 5v 34.9n 5v 35n 0v 49.9n 0v 50n 5v 54.9n 5v 55n 0v)
v2 g  gnd PWL(0n 5v)
*v3 ci gnd PWL(0n 0v 9.9n 0v 10n 5v 34.9n 5v 35n 0v 49.9n 0v 50n 5v 54.9n 5v 55n 0v)
v3 ci gnd PWL(0n 0v 0.825n 0v 0.83n 5v 2.91n 5v 2.92n 0v 4.16n 0v 4.17n 5v 4.58n 5v 4.59n 0v)

*v4 clk gnd PULSE(0v 5v 15n 0n 0n 15n 30n)
*v4 clk gnd PULSE(0v 5v 2.5n 0n 0n 2.5n 5n)
v4 clk gnd PULSE(0v 5v 1.25n 0n 0n 1.25n 2.5n)

.options post
*.tran 0.01n 80n
.tran 0.01n 10n

.meas tran t_rise trig v(co) val=0.5V rise=1 targ v(co) val=4.5V rise=1
.meas tran t_fall trig v(co) val=4.5V fall=1 targ v(co) val=0.5V fall=1
.meas t_d param='(t_rise+t_fall)/2'

.end
