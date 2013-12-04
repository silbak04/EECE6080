SRCS=$(wildcard *.sp)
OUTS=$(patsubst %.sp,%.lis,$(SRCS))

all: $(OUTS)

%.lis: %.sp
	hspice $< -o $@

error:
	grep error *.lis

clean:
	rm -f *.ic*
	rm -f *.st*
	rm -f *.lis
	rm -f *.mt0
	rm -f *.pa0
	rm -f *.sto
	rm -f *.tr0
	rm -f *.log
	rm -f *.bak
	rm -f *~

rsync:
	rsync -avz -e "ssh" ~/vlsi/hw_4/ silbaksr@everest.rhod.uc.edu:~/vlsi/hw_4/
