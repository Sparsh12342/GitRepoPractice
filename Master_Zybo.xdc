## Clock signal (125 MHz onboard clock)
set_property PACKAGE_PIN E3 [get_ports sysclk]
set_property IOSTANDARD LVCMOS33 [get_ports sysclk]
create_clock -add -name sysclk -period 8.00 -waveform {0 4} [get_ports sysclk]

## LEDs
set_property PACKAGE_PIN M14 [get_ports led[0]]
set_property IOSTANDARD LVCMOS33 [get_ports led[0]]

set_property PACKAGE_PIN M15 [get_ports led[1]]
set_property IOSTANDARD LVCMOS33 [get_ports led[1]]

set_property PACKAGE_PIN G14 [get_ports led[2]]
set_property IOSTANDARD LVCMOS33 [get_ports led[2]]

set_property PACKAGE_PIN D18 [get_ports led[3]]
set_property IOSTANDARD LVCMOS33 [get_ports led[3]]

## Switches
set_property PACKAGE_PIN F6 [get_ports sw[0]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[0]]

set_property PACKAGE_PIN G6 [get_ports sw[1]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[1]]

set_property PACKAGE_PIN H6 [get_ports sw[2]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[2]]

set_property PACKAGE_PIN H5 [get_ports sw[3]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[3]]

## Buttons
set_property PACKAGE_PIN N17 [get_ports btn[0]]
set_property IOSTANDARD LVCMOS33 [get_ports btn[0]]

set_property PACKAGE_PIN P17 [get_ports btn[1]]
set_property IOSTANDARD LVCMOS33 [get_ports btn[1]]

set_property PACKAGE_PIN P18 [get_ports btn[2]]
set_property IOSTANDARD LVCMOS33 [get_ports btn[2]]

set_property PACKAGE_PIN T17 [get_ports btn[3]]
set_property IOSTANDARD LVCMOS33 [get_ports btn[3]]
