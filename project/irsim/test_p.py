t_pi = ["1"]

with open("test_p.cmd", "w") as f:

    f.write("stepsize 10\n")
    f.write("logfile test_p.log\n")

    f.write("h VDD\n")
    f.write("l GND\n")

    f.write("vector T_CLK TSCI\n")

    f.write("w   TSCI TSPI TSPO\n")
    f.write("ana TSCI TSPI TSPO\n")

    f.write("clock T_CLK 0 1\n")
    for i in t_pi:
        if i == "1":
            f.write("h TSPI\n")
        else:
            f.write("l TSPI\n")
        f.write("c\n")

    # disable t_clk
    f.write("clock T_CLK 0 0\n")
