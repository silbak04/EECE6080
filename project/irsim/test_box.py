N_P = 32
#N_L = (N_P-1)*4
N_L = (N_P-1)

total_n = N_P + (N_L)*4

with open("test_box.cmd", "w") as f:

    f.write("stepsize 10\n")
    f.write("logfile test_box.log\n")

    f.write("h VDD\n")
    f.write("l GND\n")

    f.write("vector P_CLK PCLKI\n")
    f.write("vector L_CLK LCLKI\n")

    f.write("w   TMEI PCLKI LCLKI P_IN L_IN L_OUT LO_0 LO_1 LO_2 LO_3 LO3_1 LO_4 LO_5 LO_6 LO_7 LO_8 LO_9 LO_10 LO_11 LO_12 LO_13 M1 M2 PQ0 PQ1 PQ2 P_OUT F\n")
    f.write("ana TMEI PCLKI LCLKI P_IN L_IN L_OUT LO_0 LO_1 LO_2 LO_3 LO3_1 LO_4 LO_5 LO_6 LO_7 LO_8 LO_9 LO_10 LO_11 LO_12 LO_13 M1 M2 PQ0 PQ1 PQ2 P_OUT F\n")

    f.write("h TMEI\n")

p_in = ['1']
def p_input(p_in_bits):

    with open("test_box.cmd", "a") as f:
        f.write("clock P_CLK 0 1\n")
        for x in range(total_n):
            for i in p_in_bits:
                if i == "1":
                    f.write("h P_IN\n")
                else:
                    f.write("l P_IN\n")
                f.write("c\n")

        # disable p_clk
        f.write("clock P_CLK 0 0\n")

p_input(p_in)
