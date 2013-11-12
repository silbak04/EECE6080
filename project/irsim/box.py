N_P = 32
#N_L = (N_P-1)*4
N_L = (N_P-1)

with open("box.cmd", "w") as f:

    f.write("stepsize 10\n")
    f.write("logfile box.log\n")

    f.write("h VDD\n")
    f.write("l GND\n")

    f.write("vector P_CLK PCLKI\n")
    f.write("vector L_CLK LCLKI\n")

    f.write("w   TMEI PCLKI LCLKI P_IN L_IN L_OUT LO_0 LO_1 LO_2 LO_3 LO_4 LO_5 LO_6 LO_7 LO_8 LO_9 LO_10 LO_11 LO_12 LO_13 M1 M2 PQ0 PQ1 PQ2 BUFFI BUFFO P_OUT F\n")
    f.write("ana TMEI PCLKI LCLKI P_IN L_IN L_OUT LO_0 LO_1 LO_2 LO_3 LO_4 LO_5 LO_6 LO_7 LO_8 LO_9 LO_10 LO_11 LO_12 LO_13 M1 M2 PQ0 PQ1 PQ2 BUFFI BUFFO P_OUT F\n")

    #f.write("l TMEI\n")
    f.write("l TMEI\n")

p_in = ['1']
def p_input(p_in_bits):

    with open("box.cmd", "a") as f:
        f.write("clock P_CLK 0 1\n")
        for x in range(N_P):
            for i in p_in_bits:
                if i == "1":
                    f.write("h P_IN\n")
                else:
                    f.write("l P_IN\n")
                f.write("c\n")

        # disable p_clk
        f.write("clock P_CLK 0 0\n")

# loaded in reversed order
lut_debug = ['1','1','1','1']
lut_and   = ['1','0','0','0']
lut_nand  = ['0','1','1','1']
lut_or    = ['1','1','1','0']
lut_nor   = ['0','0','0','1']
lut_xor   = ['0','1','1','0']

def lut_input(lut_function):

    with open("box.cmd", "a") as f:
        f.write("clock L_CLK 0 1\n")
        for x in range(N_L):
            for i in lut_function:
                if i == "1":
                    f.write("h L_IN\n")
                else:
                    f.write("l L_IN\n")
                f.write("c\n")

        # disable l_clk
        f.write("clock L_CLK 0 0\n")


lut_input(lut_debug)
#lut_input(lut_nor)
p_input(p_in)
