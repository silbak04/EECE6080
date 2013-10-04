* hspice subcircuit dictionary
.include /home/silbaksr/vlsi/models/model_t36s.sp
.include /home/silbaksr/vlsi/lab_3/part_6/part_5b.spice

* CIRCUIT DESIGN *

V_dd vdd gnd 5V

* SIMULATION DESIGN *

va_0 A0 gnd PWL(0n 5V 4.9n 5V 5n 0V 19.9n 0V 20n 5v)
va_1 A1 gnd PWL(0n 0V)
va_2 A2 gnd PWL(0n 0V)
va_3 A3 gnd PWL(0n 0V)
va_4 A4 gnd PWL(0n 0V)
va_5 A5 gnd PWL(0n 0V)
va_6 A6 gnd PWL(0n 0V)
va_7 A7 gnd PWL(0n 0V)

vb_0 B0 gnd PWL(0n 5V)
vb_1 B1 gnd PWL(0n 0V)
vb_2 B2 gnd PWL(0n 0V)
vb_3 B3 gnd PWL(0n 0V)
vb_4 B4 gnd PWL(0n 0V)
vb_5 B5 gnd PWL(0n 0V)
vb_6 B6 gnd PWL(0n 0V)
vb_7 B7 gnd PWL(0n 0V)

.options post
.tran 0.01n 25n

.meas tran t_rise trig v(F) val=0.5V rise=1 targ v(F) val=4.5V rise=1
.meas tran t_fall trig v(F) val=4.5V fall=1 targ v(F) val=0.5V fall=1
.meas t_d param='(t_rise+t_fall)/2'

.end
