* hspice subcircuit dictionary
.include /home/silbaksr/vlsi/models/model_t36s.sp
.include /home/silbaksr/vlsi/lab_3/part_3/part_3.spice

V_dd vdd gnd 5V

v_a A    gnd PWL(5n 0v 9.9n 0v 10n 0v 19.9n 0v 20n 5v 24.9n 5V 25n 0V)
v_b B    gnd PWL(5n 0v 9.9n 0v 10n 5v 19.9n 5v 20n 0v 24.9n 0V 25n 0V)
v_c C_IN gnd PWL(5n 0v)

.options post
.tran 0.01n 30n

.meas tran t_rise trig v(F) val=0.5V rise=1 targ v(F) val=4.5V rise=1
.meas tran t_fall trig v(F) val=4.5V fall=1 targ v(F) val=0.5V fall=1
.meas t_d param='(t_rise+t_fall)/2'

.end
