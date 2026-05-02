# set global vars

# set init files for innovus
set init_lef_file [list lib/gsclib045.lef]

set init_verilog netlist.v
set init_top_cell tile
set init_mmmc_file mmmc.tcl

#set power and ground rails
set init_pwr_net {VDD VDD}
set init_gnd_net {VSS VSS}

#set process node
setDesignMode -process 45

set RPT_DIR rpt
file mkdir $RPT_DIR
