# EGO1: 100 MHz clk

set_property PACKAGE_PIN P17 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

# EGO1: SW0~SW7 -> sw[0]~sw[7]

set_property PACKAGE_PIN R1 [get_ports {sw[0]}]
set_property PACKAGE_PIN N4 [get_ports {sw[1]}]
set_property PACKAGE_PIN M4 [get_ports {sw[2]}]
set_property PACKAGE_PIN R2 [get_ports {sw[3]}]
set_property PACKAGE_PIN P2 [get_ports {sw[4]}]
set_property PACKAGE_PIN P3 [get_ports {sw[5]}]
set_property PACKAGE_PIN P4 [get_ports {sw[6]}]
set_property PACKAGE_PIN P5 [get_ports {sw[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]

# EGO1:
# seg7_ss0(a~dp) -> CA0~DP0, (seg7 segment selection 0)
# seg7_ss1(a~dp) -> CA1~DP1, (seg7 segment selection 1)
# seg7_cs(BIT1~BIT8) -> DN0_K1..DN1_K4. (seg7 chip selection)

# 侧数码管段选 CA0~DP0(位序 a,b,c,d,e,f,g,dp)

set_property PACKAGE_PIN B4 [get_ports {seg7_ss0[0]}]
set_property PACKAGE_PIN A4 [get_ports {seg7_ss0[1]}]
set_property PACKAGE_PIN A3 [get_ports {seg7_ss0[2]}]
set_property PACKAGE_PIN B1 [get_ports {seg7_ss0[3]}]
set_property PACKAGE_PIN A1 [get_ports {seg7_ss0[4]}]
set_property PACKAGE_PIN B3 [get_ports {seg7_ss0[5]}]
set_property PACKAGE_PIN B2 [get_ports {seg7_ss0[6]}]
set_property PACKAGE_PIN D5 [get_ports {seg7_ss0[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports {seg7_ss0[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg7_ss0[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg7_ss0[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg7_ss0[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg7_ss0[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg7_ss0[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg7_ss0[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg7_ss0[7]}]

# 侧数码管段选 CA1~DP1(位序 a,b,c,d,e,f,g,dp)

set_property PACKAGE_PIN D4 [get_ports {seg7_ss1[0]}]
set_property PACKAGE_PIN E3 [get_ports {seg7_ss1[1]}]
set_property PACKAGE_PIN D3 [get_ports {seg7_ss1[2]}]
set_property PACKAGE_PIN F4 [get_ports {seg7_ss1[3]}]
set_property PACKAGE_PIN F3 [get_ports {seg7_ss1[4]}]
set_property PACKAGE_PIN E2 [get_ports {seg7_ss1[5]}]
set_property PACKAGE_PIN D2 [get_ports {seg7_ss1[6]}]
set_property PACKAGE_PIN H2 [get_ports {seg7_ss1[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports {seg7_ss1[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg7_ss1[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg7_ss1[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg7_ss1[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg7_ss1[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg7_ss1[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg7_ss1[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg7_ss1[7]}]

# 片选 BIT1~BIT8([leftmost] seg7_cs[7]=BIT8, seg7_cs[0]=BIT1 [rightmost])

set_property PACKAGE_PIN G2 [get_ports {seg7_cs[0]}]
set_property PACKAGE_PIN C2 [get_ports {seg7_cs[1]}]
set_property PACKAGE_PIN C1 [get_ports {seg7_cs[2]}]
set_property PACKAGE_PIN H1 [get_ports {seg7_cs[3]}]
set_property PACKAGE_PIN G1 [get_ports {seg7_cs[4]}]
set_property PACKAGE_PIN F1 [get_ports {seg7_cs[5]}]
set_property PACKAGE_PIN E1 [get_ports {seg7_cs[6]}]
set_property PACKAGE_PIN G6 [get_ports {seg7_cs[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports {seg7_cs[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg7_cs[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg7_cs[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg7_cs[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg7_cs[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg7_cs[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg7_cs[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg7_cs[7]}]