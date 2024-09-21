# Define the Makefile variables for the four arguments
cell ?= nand2_2
cell_inputs ?= in pull_up
cpar ?= 0.1f
fanout ?= 1

run: tpd_test_template.cir
	@echo "Replacing nominal values with cell=$(cell), cell_inputs=$(cell_inputs), cpar=$(cpar), and fanout=$(fanout)"
	@sed -e "s/CPARVALUE/$(cpar)/g" \
	     -e "s/FANOUTVALUE/$(fanout)/g" \
	     -e "s/CELLNAMEVALUE/$(cell)/g" \
	     -e "s/CELLINPUTSVALUE/$(cell_inputs)/g" \
	     tpd_test_template.cir > tpd_test.cir
	/data02/ECE4203/bin/ngspice tpd_test.cir
