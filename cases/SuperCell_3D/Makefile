SHELL := /bin/bash -l
PBS_ACCOUNT ?= SCSG0001

run:
	$(MAKE) inputs
	qsub -A $(PBS_ACCOUNT) supercell.pbs

clean:
	rm -f inputs_* *~

clobber:
	git clean -xdf .

inputs_Supercell_3D: Makefile
	wget -O $@ https://raw.githubusercontent.com/erf-model/ERF/refs/heads/development/Exec/SuperCell_3D/$@

inputs: inputs_Supercell_3D
