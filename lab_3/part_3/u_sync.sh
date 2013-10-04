#!/bin/sh

rsync -e "ssh -p22" -avz --stats --progress silbaksr@everest.rhod.uc.edu:/home/silbaksr/vlsi/lab_3/part_3/ \
	      /home/silbaksr/vlsi/lab_3/part_3/ --exclude="u_sync.sh" --exclude=".*"

