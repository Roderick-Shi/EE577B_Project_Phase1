###################################################################

# Created by write_sdc on Sun Oct 12 11:36:47 2025

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
create_clock [get_ports clk]  -period 5  -waveform {0 2.5}
set_max_delay 5  -to [get_ports {L_A[2]}]
set_max_delay 5  -to [get_ports {L_A[1]}]
set_max_delay 5  -to [get_ports {L_A[0]}]
set_max_delay 5  -to [get_ports {L_B[2]}]
set_max_delay 5  -to [get_ports {L_B[1]}]
set_max_delay 5  -to [get_ports {L_B[0]}]
set_max_delay 5  -to [get_ports RA]
set_max_delay 5  -to [get_ports RB]
set_max_delay 5  -from [list [get_ports clk] [get_ports reset] [get_ports ERR] [get_ports PA]  \
[get_ports PB]]
