N_P = 64
N_L = (N_P-1)*4

with open("top.cmd", "w") as f:

    f.write("stepsize 10\n")
    f.write("logfile top.log\n")

    f.write("h VDD\n")
    f.write("l GND\n")

    f.write("vector PCLKI\n")
    f.write("vector LCLKI\n")

    f.write("vector L_IN\n")
    f.write("vector P_IN\n")

    f.write("w   PCLKI LCLKI P_IN L_IN P_OUT L_OUT F\n")
    f.write("ana PCLKI LCLKI P_IN L_IN P_OUT L_OUT F\n")

    f.write("l TESTO\n")

def p_input():

    with open("top.cmd", "a") as f:
        for i in range(0, N_P-1):
            f.write("P_IN 1\n")
            f.write("clock PCLKI 0 1\n")
        return

lut_and   = ['1','0','0','0']
lut_nand  = ['0','1','1','1']
lut_or    = ['1','1','1','0']
lut_nor   = ['0','0','0','1']
lut_xor   = ['0','1','1','0']

def lut_input(lut_function):

    with open("top.cmd", "a") as f:
        for i in range(0, N_L-1):
            for j in range(len(lut_function)):
                f.write("L_IN %s\n" % (str(lut_function[j])))
                f.write("clock LCLKI 0 1\n")
        return

p_input()
lut_input(lut_and)
