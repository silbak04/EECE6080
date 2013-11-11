N_P = 32
#N_L = (N_P-1)*4
N_L = (N_P-1)

with open("top.cmd", "w") as f:

    f.write("stepsize 10\n")
    f.write("logfile top.log\n")

    f.write("h VDD\n")
    f.write("l GND\n")

    f.write("vector P_CLK PCLKI\n")
    f.write("vector L_CLK LCLKI\n")

    f.write("vector lin L_IN\n")
    f.write("vector pin P_IN\n")

    f.write("w   PCLKI LCLKI P_IN L_IN L_OUT F\n")
    f.write("ana PCLKI LCLKI P_IN L_IN L_OUT F\n")

    f.write("l TMEI\n")
    #f.write("l TMEO\n")

def p_input():

    with open("top.cmd", "a") as f:
        for i in range(0, N_P):
            f.write("setvector P_CLK 0\n")
            f.write("setvector pin   1\n")
            f.write("s\n")
            f.write("setvector P_CLK 1\n")
            f.write("s\n")
            print i

        # disable p_clk
        f.write("setvector P_CLK 0\n")
        f.write("s\n")

# loaded in reversed order
lut_and   = ['1','0','0','0']
lut_nand  = ['0','1','1','1']
lut_or    = ['1','1','1','0']
lut_nor   = ['0','0','0','1']
lut_xor   = ['0','1','1','0']

def lut_input(lut_function):

    with open("top.cmd", "a") as f:
        for i in range(0, N_L):
            for j in range(len(lut_function)):
                f.write("setvector L_CLK 0\n")
                f.write("setvector lin %s\n" % (str(lut_function[j])))
                f.write("s\n")
                f.write("setvector L_CLK 1\n")
                f.write("s\n")
                print i,j

        # disable l_clk
        f.write("setvector L_CLK 0\n")
        f.write("s\n")

p_input()
lut_input(lut_and)
