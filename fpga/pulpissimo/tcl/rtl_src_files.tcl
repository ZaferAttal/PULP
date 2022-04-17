if ![info exists PULP_FPGA_SIM] {
    set RTL /data/scratch/ge75caz/PULP/pulp/rtl
    set IPS /data/scratch/ge75caz/PULP/pulp/ips
    set FPGA_IPS ../ips
    set FPGA_RTL ../rtl
}



# pulpemu
set SRC_PULPEMU " \
    $RTL/pulpemu/fpga_clk_gen.sv \
    $RTL/pulpemu/fpga_slow_clk_gen.sv \
    $RTL/pulpemu/pad_functional_xilinx.sv \
    $RTL/pulpemu/fpga_bootrom.sv \
    $RTL/pulpemu/fpga_interleaved_ram.sv \
    $RTL/pulpemu/fpga_private_ram.sv \
    $RTL/pulpemu/pulpemu.sv \
    $RTL/pulpemu/pulpemu_ref_clk_div.sv \
    $RTL/pulpemu/pulp_clock_gating_xilinx.sv \
"
set INC_PULPEMU " \
    $RTL/pulpemu/../includes \
    $RTL/pulpemu/. \
"

# pulp
set SRC_PULP " \
    $RTL/pulp/../../ips/pulp_soc/rtl/pulp_soc/pkg_soc_interconnect.sv \
    $RTL/pulp/../../ips/axi/axi/src/axi_pkg.sv \
    $RTL/pulp/jtag_tap_top.sv \
    $RTL/pulp/pad_control.sv \
    $RTL/pulp/pad_frame.sv \
    $RTL/pulp/cluster_domain.sv \
    $RTL/pulp/safe_domain.sv \
    $RTL/pulp/soc_domain.sv \
    $RTL/pulp/rtc_date.sv \
    $RTL/pulp/rtc_clock.sv \
    $RTL/pulp/pulp.sv \
"
set INC_PULP " \
    $RTL/pulp/../includes \
"
