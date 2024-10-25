SHELL := /bin/bash -l
PBS_ACCOUNT ?= SCSG0001

run:
	$(MAKE) inputs
	qsub -A $(PBS_ACCOUNT) abl.pbs

clean:
	rm -f inputs_* *~

clobber:
	git clean -xdf .

%.orig: Makefile
	wget -O $@ https://raw.githubusercontent.com/erf-model/ERF/refs/heads/development/Exec/ABL/$*

inputs_smagorinsky-%: inputs_smagorinsky.orig
	size=$* ; \
	extent=$$((1024*$$size)) ; \
	nxyz=$$((64*$$size)) ; \
	rm -f $@ ; \
	cp $< $@ ; \
	sed -i "s/1024/$$extent/g" $@ ; \
	sed -i "s/64/$$nxyz/g" $@ ; \

inputs: inputs_smagorinsky.orig
	for size in 1 2 4; do \
	  ofile="$<" ; \
	  ofile=$${ofile//".orig"/"-$$size"} ; \
	  $(MAKE) $${ofile} ; \
	done
