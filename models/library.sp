* Samir Silbak
* M03321037

* hspice subcircuit dictionary
.include /home/silbaksr/vlsi/models/model_t36s.sp

* FET Parameters
.param w_nmos = 0.9u
.param w_pmos = 0.9u
.param length = 0.6u
.param l_diff = 2u

* N-NAND
.subckt nnand clk a b f vdd gnd
    mpmos_1 vdd clk f       vdd pfet w=w_pmos l=length ad=(w_pmos*l_diff) pd=(2*l_diff+2*w_pmos) as=(w_pmos*l_diff) ps=(2*l_diff+2*w_pmos)
    mnmos_2 f    a  t_23    gnd nfet w=w_nmos l=length ad=(w_nmos*l_diff) pd=(2*l_diff+2*w_nmos) as=(w_nmos*l_diff) ps=(2*l_diff+2*w_nmos)
    mnmos_3 t_23 b  t_34    gnd nfet w=w_nmos l=length ad=(w_nmos*l_diff) pd=(2*l_diff+2*w_nmos) as=(w_nmos*l_diff) ps=(2*l_diff+2*w_nmos)
    mnmos_4 t_34 clk gnd    gnd nfet w=w_nmos l=length ad=(w_nmos*l_diff) pd=(2*l_diff+2*w_nmos) as=(w_nmos*l_diff) ps=(2*l_diff+2*w_nmos)
.ends

* P-NAND
.subckt pnand clk a b f vdd gnd
    mpmos_1 vdd clk t_56    vdd pfet w=w_pmos l=length ad=(w_pmos*l_diff) pd=(2*l_diff+2*w_pmos) as=(w_pmos*l_diff) ps=(2*l_diff+2*w_pmos)
    mpmos_2 t_56 a  f       vdd pfet w=w_pmos l=length ad=(w_pmos*l_diff) pd=(2*l_diff+2*w_pmos) as=(w_pmos*l_diff) ps=(2*l_diff+2*w_pmos)
    mpmos_3 t_56 b  f       vdd pfet w=w_pmos l=length ad=(w_pmos*l_diff) pd=(2*l_diff+2*w_pmos) as=(w_pmos*l_diff) ps=(2*l_diff+2*w_pmos)
    mnmos_1 f    clk gnd    gnd nfet w=w_nmos l=length ad=(w_nmos*l_diff) pd=(2*l_diff+2*w_nmos) as=(w_nmos*l_diff) ps=(2*l_diff+2*w_nmos)
.ends

* INVERTER
.subckt inv a f vdd gnd
    mpmos_1 vdd a f         vdd pfet w=w_pmos l=length ad=(w_pmos*l_diff) pd=(2*l_diff+2*w_pmos) as=(w_pmos*l_diff) ps=(2*l_diff+2*w_pmos)
    mnmos_2 f   a gnd       gnd nfet w=w_nmos l=length ad=(w_nmos*l_diff) pd=(2*l_diff+2*w_nmos) as=(w_nmos*l_diff) ps=(2*l_diff+2*w_nmos)
.ends

* CARRY
.subckt carry clk_p clk_n p g ci co vdd gnd
    Xnnand clk_p p  ci f1   vdd gnd nnand
    Xinv         g     f2   vdd gnd inv
    Xpnand clk_n f1 f2 co   vdd gnd pnand
.ends

.end
