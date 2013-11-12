t_dff = ["1"]

with open("test_dff.cmd", "w") as f:

    f.write("stepsize 10\n")
    f.write("logfile test_dff.log\n")

    f.write("h VDD\n")
    f.write("l GND\n")

    f.write("vector T_CLK TFCI\n")

    f.write("w   TFCI TFDI TFQO\n")
    f.write("ana TFCI TFDI TFQO\n")

    f.write("clock T_CLK 0 1\n")
    for i in t_dff:
        if i == "1":
            f.write("h TFDI\n")
        else:
            f.write("l TFDI\n")
        f.write("c\n")

    # disable t_clk
    f.write("clock T_CLK 0 0\n")
