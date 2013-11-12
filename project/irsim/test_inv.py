t_inv = ['1', '0']

with open("test_inv.cmd", "w") as f:

    f.write("stepsize 10\n")
    f.write("logfile test_inv.log\n")

    f.write("h VDD\n")
    f.write("l GND\n")

    f.write("w   TII TIO\n")
    f.write("ana TII TIO\n")

    for i in t_inv:
        if i == "1":
            f.write("h TII\n")
        else:
            f.write("l TII\n")
        f.write("s\n")
