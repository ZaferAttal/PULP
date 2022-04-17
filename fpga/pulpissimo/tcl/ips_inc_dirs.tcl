if ![info exists INCLUDE_DIRS] {
	set INCLUDE_DIRS ""
}

eval "set INCLUDE_DIRS {
    /data/scratch/ge75caz/PULP/pulp/rtl/includes \
    /data/scratch/ge75caz/PULP/pulp/ips/common_cells/include \
    /data/scratch/ge75caz/PULP/pulp/ips/cluster_interconnect/rtl/low_latency_interco \
    /data/scratch/ge75caz/PULP/pulp/ips/cluster_interconnect/rtl/peripheral_interco \
    /data/scratch/ge75caz/PULP/pulp/ips/cluster_interconnect/../../rtl/includes \
    /data/scratch/ge75caz/PULP/pulp/ips/adv_dbg_if/rtl \
    /data/scratch/ge75caz/PULP/pulp/ips/apb/apb_adv_timer/./rtl \
    /data/scratch/ge75caz/PULP/pulp/ips/axi/axi/include \
    /data/scratch/ge75caz/PULP/pulp/ips/axi/axi/../../common_cells/include \
    /data/scratch/ge75caz/PULP/pulp/ips/timer_unit/rtl \
    /data/scratch/ge75caz/PULP/pulp/ips/fpnew/../common_cells/include \
    /data/scratch/ge75caz/PULP/pulp/ips/jtag_pulp/../../rtl/includes \
    /data/scratch/ge75caz/PULP/pulp/ips/cv32e40p/./rtl/include \
    /data/scratch/ge75caz/PULP/pulp/ips/cv32e40p/../../rtl/includes \
    /data/scratch/ge75caz/PULP/pulp/ips/cv32e40p/./rtl/include \
    /data/scratch/ge75caz/PULP/pulp/ips/ibex/rtl \
    /data/scratch/ge75caz/PULP/pulp/ips/ibex/vendor/lowrisc_ip/ip/prim/rtl \
    /data/scratch/ge75caz/PULP/pulp/ips/udma/udma_core/./rtl \
    /data/scratch/ge75caz/PULP/pulp/ips/udma/udma_i2c/rtl \
    /data/scratch/ge75caz/PULP/pulp/ips/udma/udma_qspi/rtl \
    /data/scratch/ge75caz/PULP/pulp/ips/hwpe-ctrl/rtl \
    /data/scratch/ge75caz/PULP/pulp/ips/hwpe-stream/rtl \
    /data/scratch/ge75caz/PULP/pulp/ips/hwpe-mac-engine/rtl \
    /data/scratch/ge75caz/PULP/pulp/ips/register_interface/include \
    /data/scratch/ge75caz/PULP/pulp/ips/register_interface/../axi/axi/include \
    /data/scratch/ge75caz/PULP/pulp/ips/register_interface/../common_cells/include \
    /data/scratch/ge75caz/PULP/pulp/ips/register_interface/include \
    /data/scratch/ge75caz/PULP/pulp/ips/register_interface/../axi/axi/include \
    /data/scratch/ge75caz/PULP/pulp/ips/register_interface/../common_cells/include \
    /data/scratch/ge75caz/PULP/pulp/ips/pulp_soc/../../rtl/includes \
    /data/scratch/ge75caz/PULP/pulp/ips/pulp_soc/rtl/include \
    /data/scratch/ge75caz/PULP/pulp/ips/pulp_soc/../axi/axi/include \
    /data/scratch/ge75caz/PULP/pulp/ips/pulp_soc/../../rtl/includes \
    /data/scratch/ge75caz/PULP/pulp/ips/pulp_soc/. \
    /data/scratch/ge75caz/PULP/pulp/ips/pulp_soc/../../rtl/includes \
    /data/scratch/ge75caz/PULP/pulp/ips/pulp_soc/. \
    /data/scratch/ge75caz/PULP/pulp/ips/pulp_soc/../../rtl/includes \
    /data/scratch/ge75caz/PULP/pulp/ips/fpu_interco/../cv32e40p/rtl/include \
    /data/scratch/ge75caz/PULP/pulp/ips/pulp_cluster/../../rtl/includes \
    /data/scratch/ge75caz/PULP/pulp/ips/pulp_cluster/packages \
    /data/scratch/ge75caz/PULP/pulp/ips/pulp_cluster/../axi/axi/include \
    /data/scratch/ge75caz/PULP/pulp/ips/pulp_cluster/../axi/axi/include/axi \
	${INCLUDE_DIRS} \
}"
