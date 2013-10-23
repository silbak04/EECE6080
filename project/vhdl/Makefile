FLAGS = --ieee=synopsys --work=work -fexplicit
#FLAGS = --ieee=synopsys --warn-no-vital-generic \
#        --workdir=synth --work=work -fexplicit

FILES = $(wildcard *.vhd)
tb = top_tb

all: compile

compile: $(FILES)
	ghdl -a $(FLAGS) *.vhdl
	ghdl -a $(FLAGS) $(tb).vhd
	ghdl -e $(FLAGS) $(tb)

run:
	ghdl -r $(FLAGS) $(tb) --vcd=$(tb).vcd

view:
	gtkwave $(tb).vcd

clean:
	ghdl --clean
	rm -f work-obj93.cf
