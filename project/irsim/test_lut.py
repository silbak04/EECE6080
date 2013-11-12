lin_debug = ['1','1','1','1']
lin_and   = ['1','0','0','0']
lin_nand  = ['0','1','1','1']
lin_or    = ['1','1','1','0']
lin_nor   = ['0','0','0','1']
lin_xor   = ['0','1','1','0']

A         = "1"
B         = "1"

with open("test_lut.cmd", "w") as f:

    f.write("stepsize 10\n")
    f.write("logfile test_lut.log\n")

    f.write("h VDD\n")
    f.write("l GND\n")

    f.write("vector T_CLK TSCI\n")

    f.write("w   TSCI TSLI TSA TSB TSLO TSF\n")
    f.write("ana TSCI TSLI TSA TSB TSLO TSF\n")

    f.write("clock TSCI 0 1\n")
    for i in lin_debug:
        if i == "1":
            f.write("h TSLI\n")
        else:
            f.write("l TSLI\n")
        f.write("c\n")

    # disable t_clk
    f.write("clock TSCI 0 0\n")

    f.write("clock TSCI 0 1\n")
    for i in A,B:
        if i == "1":
            f.write("h TSA\n")
            f.write("h TSB\n")
        else:
            f.write("l TSA\n")
            f.write("l TSB\n")
        f.write("c\n")

    # disable t_clk
    f.write("clock TSCI 0 0\n")
