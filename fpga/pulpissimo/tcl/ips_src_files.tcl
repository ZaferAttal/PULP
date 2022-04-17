if ![info exists PULP_FPGA_SIM] {
    set RTL /data/scratch/ge75caz/PULP/pulp/rtl
    set IPS /data/scratch/ge75caz/PULP/pulp/ips
    set FPGA_IPS ../ips
    set FPGA_RTL ../rtl
}

# common_cells_all
set SRC_COMMON_CELLS_ALL " \
    $IPS/common_cells/src/binary_to_gray.sv \
    $IPS/common_cells/src/cb_filter_pkg.sv \
    $IPS/common_cells/src/cdc_2phase.sv \
    $IPS/common_cells/src/cf_math_pkg.sv \
    $IPS/common_cells/src/clk_div.sv \
    $IPS/common_cells/src/delta_counter.sv \
    $IPS/common_cells/src/ecc_pkg.sv \
    $IPS/common_cells/src/edge_propagator_tx.sv \
    $IPS/common_cells/src/exp_backoff.sv \
    $IPS/common_cells/src/fifo_v3.sv \
    $IPS/common_cells/src/gray_to_binary.sv \
    $IPS/common_cells/src/isochronous_spill_register.sv \
    $IPS/common_cells/src/lfsr.sv \
    $IPS/common_cells/src/lfsr_16bit.sv \
    $IPS/common_cells/src/lfsr_8bit.sv \
    $IPS/common_cells/src/mv_filter.sv \
    $IPS/common_cells/src/onehot_to_bin.sv \
    $IPS/common_cells/src/plru_tree.sv \
    $IPS/common_cells/src/popcount.sv \
    $IPS/common_cells/src/rr_arb_tree.sv \
    $IPS/common_cells/src/rstgen_bypass.sv \
    $IPS/common_cells/src/serial_deglitch.sv \
    $IPS/common_cells/src/shift_reg.sv \
    $IPS/common_cells/src/spill_register.sv \
    $IPS/common_cells/src/stream_demux.sv \
    $IPS/common_cells/src/stream_filter.sv \
    $IPS/common_cells/src/stream_fork.sv \
    $IPS/common_cells/src/stream_intf.sv \
    $IPS/common_cells/src/stream_join.sv \
    $IPS/common_cells/src/stream_mux.sv \
    $IPS/common_cells/src/sub_per_hash.sv \
    $IPS/common_cells/src/sync.sv \
    $IPS/common_cells/src/sync_wedge.sv \
    $IPS/common_cells/src/unread.sv \
    $IPS/common_cells/src/addr_decode.sv \
    $IPS/common_cells/src/cb_filter.sv \
    $IPS/common_cells/src/cdc_fifo_2phase.sv \
    $IPS/common_cells/src/cdc_fifo_gray.sv \
    $IPS/common_cells/src/counter.sv \
    $IPS/common_cells/src/ecc_decode.sv \
    $IPS/common_cells/src/ecc_encode.sv \
    $IPS/common_cells/src/edge_detect.sv \
    $IPS/common_cells/src/lzc.sv \
    $IPS/common_cells/src/max_counter.sv \
    $IPS/common_cells/src/rstgen.sv \
    $IPS/common_cells/src/stream_delay.sv \
    $IPS/common_cells/src/stream_fifo.sv \
    $IPS/common_cells/src/stream_fork_dynamic.sv \
    $IPS/common_cells/src/stream_xbar.sv \
    $IPS/common_cells/src/fall_through_register.sv \
    $IPS/common_cells/src/id_queue.sv \
    $IPS/common_cells/src/stream_to_mem.sv \
    $IPS/common_cells/src/stream_arbiter_flushable.sv \
    $IPS/common_cells/src/stream_omega_net.sv \
    $IPS/common_cells/src/stream_register.sv \
    $IPS/common_cells/src/stream_arbiter.sv \
    $IPS/common_cells/src/deprecated/clock_divider_counter.sv \
    $IPS/common_cells/src/deprecated/find_first_one.sv \
    $IPS/common_cells/src/deprecated/generic_LFSR_8bit.sv \
    $IPS/common_cells/src/deprecated/generic_fifo.sv \
    $IPS/common_cells/src/deprecated/generic_fifo_adv.sv \
    $IPS/common_cells/src/deprecated/pulp_sync.sv \
    $IPS/common_cells/src/deprecated/pulp_sync_wedge.sv \
    $IPS/common_cells/src/deprecated/clock_divider.sv \
    $IPS/common_cells/src/deprecated/fifo_v2.sv \
    $IPS/common_cells/src/deprecated/prioarbiter.sv \
    $IPS/common_cells/src/deprecated/rrarbiter.sv \
    $IPS/common_cells/src/deprecated/fifo_v1.sv \
    $IPS/common_cells/src/edge_propagator.sv \
    $IPS/common_cells/src/edge_propagator_rx.sv \
"
set INC_COMMON_CELLS_ALL " \
    $IPS/common_cells/include \
"

# soc_interconnect
set SRC_SOC_INTERCONNECT " \
    $IPS/L2_tcdm_hybrid_interco/RTL/l2_tcdm_demux.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/lint_2_apb.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/lint_2_axi.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/axi_2_lint/axi64_2_lint32.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/axi_2_lint/axi_read_ctrl.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/axi_2_lint/axi_write_ctrl.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/axi_2_lint/lint64_to_32.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_L2/AddressDecoder_Req_L2.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_L2/AddressDecoder_Resp_L2.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_L2/ArbitrationTree_L2.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_L2/FanInPrimitive_Req_L2.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_L2/FanInPrimitive_Resp_L2.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_L2/MUX2_REQ_L2.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_L2/RequestBlock_L2_1CH.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_L2/RequestBlock_L2_2CH.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_L2/ResponseBlock_L2.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_L2/ResponseTree_L2.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_L2/RR_Flag_Req_L2.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_L2/XBAR_L2.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/AddressDecoder_Req_BRIDGE.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/AddressDecoder_Resp_BRIDGE.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/ArbitrationTree_BRIDGE.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/FanInPrimitive_Req_BRIDGE.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/FanInPrimitive_Resp_BRIDGE.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/MUX2_REQ_BRIDGE.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/RequestBlock1CH_BRIDGE.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/RequestBlock2CH_BRIDGE.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/ResponseBlock_BRIDGE.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/ResponseTree_BRIDGE.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/RR_Flag_Req_BRIDGE.sv \
    $IPS/L2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/XBAR_BRIDGE.sv \
"

# low_latency_interco
set SRC_LOW_LATENCY_INTERCO " \
    $IPS/cluster_interconnect/rtl/low_latency_interco/FanInPrimitive_Req.sv \
    $IPS/cluster_interconnect/rtl/low_latency_interco/ArbitrationTree.sv \
    $IPS/cluster_interconnect/rtl/low_latency_interco/MUX2_REQ.sv \
    $IPS/cluster_interconnect/rtl/low_latency_interco/AddressDecoder_Resp.sv \
    $IPS/cluster_interconnect/rtl/low_latency_interco/TestAndSet.sv \
    $IPS/cluster_interconnect/rtl/low_latency_interco/RequestBlock2CH.sv \
    $IPS/cluster_interconnect/rtl/low_latency_interco/RequestBlock1CH.sv \
    $IPS/cluster_interconnect/rtl/low_latency_interco/FanInPrimitive_Resp.sv \
    $IPS/cluster_interconnect/rtl/low_latency_interco/ResponseTree.sv \
    $IPS/cluster_interconnect/rtl/low_latency_interco/ResponseBlock.sv \
    $IPS/cluster_interconnect/rtl/low_latency_interco/AddressDecoder_Req.sv \
    $IPS/cluster_interconnect/rtl/low_latency_interco/XBAR_TCDM.sv \
    $IPS/cluster_interconnect/rtl/low_latency_interco/XBAR_TCDM_WRAPPER.sv \
    $IPS/cluster_interconnect/rtl/low_latency_interco/TCDM_PIPE_REQ.sv \
    $IPS/cluster_interconnect/rtl/low_latency_interco/TCDM_PIPE_RESP.sv \
    $IPS/cluster_interconnect/rtl/low_latency_interco/grant_mask.sv \
    $IPS/cluster_interconnect/rtl/low_latency_interco/priority_Flag_Req.sv \
"
set INC_LOW_LATENCY_INTERCO " \
    $IPS/cluster_interconnect/rtl/low_latency_interco \
"

# peripheral_interco
set SRC_PERIPHERAL_INTERCO " \
    $IPS/cluster_interconnect/rtl/peripheral_interco/AddressDecoder_PE_Req.sv \
    $IPS/cluster_interconnect/rtl/peripheral_interco/AddressDecoder_Resp_PE.sv \
    $IPS/cluster_interconnect/rtl/peripheral_interco/ArbitrationTree_PE.sv \
    $IPS/cluster_interconnect/rtl/peripheral_interco/FanInPrimitive_Req_PE.sv \
    $IPS/cluster_interconnect/rtl/peripheral_interco/RR_Flag_Req_PE.sv \
    $IPS/cluster_interconnect/rtl/peripheral_interco/MUX2_REQ_PE.sv \
    $IPS/cluster_interconnect/rtl/peripheral_interco/FanInPrimitive_PE_Resp.sv \
    $IPS/cluster_interconnect/rtl/peripheral_interco/RequestBlock1CH_PE.sv \
    $IPS/cluster_interconnect/rtl/peripheral_interco/RequestBlock2CH_PE.sv \
    $IPS/cluster_interconnect/rtl/peripheral_interco/ResponseBlock_PE.sv \
    $IPS/cluster_interconnect/rtl/peripheral_interco/ResponseTree_PE.sv \
    $IPS/cluster_interconnect/rtl/peripheral_interco/XBAR_PE.sv \
"
set INC_PERIPHERAL_INTERCO " \
    $IPS/cluster_interconnect/rtl/peripheral_interco \
    $IPS/cluster_interconnect/../../rtl/includes \
"

# tcdm_interconnect
set SRC_TCDM_INTERCONNECT " \
    $IPS/cluster_interconnect/rtl/tcdm_interconnect/tcdm_interconnect_pkg.sv \
    $IPS/cluster_interconnect/rtl/tcdm_interconnect/addr_dec_resp_mux.sv \
    $IPS/cluster_interconnect/rtl/tcdm_interconnect/amo_shim.sv \
    $IPS/cluster_interconnect/rtl/tcdm_interconnect/xbar.sv \
    $IPS/cluster_interconnect/rtl/tcdm_interconnect/clos_net.sv \
    $IPS/cluster_interconnect/rtl/tcdm_interconnect/bfly_net.sv \
    $IPS/cluster_interconnect/rtl/tcdm_interconnect/tcdm_interconnect.sv \
"

# adv_dbg_if
set SRC_ADV_DBG_IF " \
    $IPS/adv_dbg_if/rtl/adbg_axi_biu.sv \
    $IPS/adv_dbg_if/rtl/adbg_axi_module.sv \
    $IPS/adv_dbg_if/rtl/adbg_lint_biu.sv \
    $IPS/adv_dbg_if/rtl/adbg_lint_module.sv \
    $IPS/adv_dbg_if/rtl/adbg_crc32.v \
    $IPS/adv_dbg_if/rtl/adbg_or1k_biu.sv \
    $IPS/adv_dbg_if/rtl/adbg_or1k_module.sv \
    $IPS/adv_dbg_if/rtl/adbg_or1k_status_reg.sv \
    $IPS/adv_dbg_if/rtl/adbg_top.sv \
    $IPS/adv_dbg_if/rtl/bytefifo.v \
    $IPS/adv_dbg_if/rtl/syncflop.v \
    $IPS/adv_dbg_if/rtl/syncreg.v \
    $IPS/adv_dbg_if/rtl/adbg_tap_top.v \
    $IPS/adv_dbg_if/rtl/adv_dbg_if.sv \
    $IPS/adv_dbg_if/rtl/adbg_axionly_top.sv \
    $IPS/adv_dbg_if/rtl/adbg_lintonly_top.sv \
"
set INC_ADV_DBG_IF " \
    $IPS/adv_dbg_if/rtl \
"

# apb2per
set SRC_APB2PER " \
    $IPS/apb/apb2per/apb2per.sv \
"

# apb_adv_timer
set SRC_APB_ADV_TIMER " \
    $IPS/apb/apb_adv_timer/./rtl/adv_timer_apb_if.sv \
    $IPS/apb/apb_adv_timer/./rtl/comparator.sv \
    $IPS/apb/apb_adv_timer/./rtl/input_stage.sv \
    $IPS/apb/apb_adv_timer/./rtl/lut_4x4.sv \
    $IPS/apb/apb_adv_timer/./rtl/out_filter.sv \
    $IPS/apb/apb_adv_timer/./rtl/timer_cntrl.sv \
    $IPS/apb/apb_adv_timer/./rtl/up_down_counter.sv \
    $IPS/apb/apb_adv_timer/./rtl/prescaler.sv \
    $IPS/apb/apb_adv_timer/./rtl/timer_module.sv \
    $IPS/apb/apb_adv_timer/./rtl/apb_adv_timer.sv \
"
set INC_APB_ADV_TIMER " \
    $IPS/apb/apb_adv_timer/./rtl \
"

# apb_fll_if
set SRC_APB_FLL_IF " \
    $IPS/apb/apb_fll_if/src/fll_intf.sv \
    $IPS/apb/apb_fll_if/src/apb_fll_if.sv \
    $IPS/apb/apb_fll_if/src/apb_to_fll.sv \
"

# apb_gpio
set SRC_APB_GPIO " \
    $IPS/apb/apb_gpio/./rtl/apb_gpio.sv \
"

# apb_node
set SRC_APB_NODE " \
    $IPS/apb/apb_node/src/apb_node.sv \
    $IPS/apb/apb_node/src/apb_node_wrap.sv \
"

# apb_interrupt_cntrl
set SRC_APB_INTERRUPT_CNTRL " \
    $IPS/apb_interrupt_cntrl/apb_interrupt_cntrl.sv \
"

# axi
set SRC_AXI " \
    $IPS/axi/axi/src/axi_pkg.sv \
    $IPS/axi/axi/src/axi_intf.sv \
    $IPS/axi/axi/src/axi_atop_filter.sv \
    $IPS/axi/axi/src/axi_burst_splitter.sv \
    $IPS/axi/axi/src/axi_cdc_dst.sv \
    $IPS/axi/axi/src/axi_cdc_src.sv \
    $IPS/axi/axi/src/axi_cut.sv \
    $IPS/axi/axi/src/axi_delayer.sv \
    $IPS/axi/axi/src/axi_demux.sv \
    $IPS/axi/axi/src/axi_dw_downsizer.sv \
    $IPS/axi/axi/src/axi_dw_upsizer.sv \
    $IPS/axi/axi/src/axi_id_prepend.sv \
    $IPS/axi/axi/src/axi_isolate.sv \
    $IPS/axi/axi/src/axi_join.sv \
    $IPS/axi/axi/src/axi_lite_demux.sv \
    $IPS/axi/axi/src/axi_lite_join.sv \
    $IPS/axi/axi/src/axi_lite_mailbox.sv \
    $IPS/axi/axi/src/axi_lite_mux.sv \
    $IPS/axi/axi/src/axi_lite_regs.sv \
    $IPS/axi/axi/src/axi_lite_to_apb.sv \
    $IPS/axi/axi/src/axi_lite_to_axi.sv \
    $IPS/axi/axi/src/axi_modify_address.sv \
    $IPS/axi/axi/src/axi_mux.sv \
    $IPS/axi/axi/src/axi_serializer.sv \
    $IPS/axi/axi/src/axi_cdc.sv \
    $IPS/axi/axi/src/axi_err_slv.sv \
    $IPS/axi/axi/src/axi_dw_converter.sv \
    $IPS/axi/axi/src/axi_multicut.sv \
    $IPS/axi/axi/src/axi_to_axi_lite.sv \
    $IPS/axi/axi/src/axi_lite_xbar.sv \
    $IPS/axi/axi/src/axi_xbar.sv \
"
set INC_AXI " \
    $IPS/axi/axi/include \
    $IPS/axi/axi/../../common_cells/include \
"


# axi_slice
set SRC_AXI_SLICE " \
    $IPS/axi/axi_slice/src/axi_single_slice.sv \
    $IPS/axi/axi_slice/src/axi_ar_buffer.sv \
    $IPS/axi/axi_slice/src/axi_aw_buffer.sv \
    $IPS/axi/axi_slice/src/axi_b_buffer.sv \
    $IPS/axi/axi_slice/src/axi_r_buffer.sv \
    $IPS/axi/axi_slice/src/axi_slice.sv \
    $IPS/axi/axi_slice/src/axi_w_buffer.sv \
    $IPS/axi/axi_slice/src/axi_slice_wrap.sv \
"

# timer_unit
set SRC_TIMER_UNIT " \
    $IPS/timer_unit/./rtl/apb_timer_unit.sv \
    $IPS/timer_unit/./rtl/timer_unit.sv \
    $IPS/timer_unit/./rtl/timer_unit_counter.sv \
    $IPS/timer_unit/./rtl/timer_unit_counter_presc.sv \
"
set INC_TIMER_UNIT " \
    $IPS/timer_unit/rtl \
"

# div_sqrt_top_mvp
set SRC_DIV_SQRT_TOP_MVP " \
    $IPS/fpu_div_sqrt_mvp/hdl/defs_div_sqrt_mvp.sv \
    $IPS/fpu_div_sqrt_mvp/hdl/control_mvp.sv \
    $IPS/fpu_div_sqrt_mvp/hdl/div_sqrt_mvp_wrapper.sv \
    $IPS/fpu_div_sqrt_mvp/hdl/div_sqrt_top_mvp.sv \
    $IPS/fpu_div_sqrt_mvp/hdl/iteration_div_sqrt_mvp.sv \
    $IPS/fpu_div_sqrt_mvp/hdl/norm_div_sqrt_mvp.sv \
    $IPS/fpu_div_sqrt_mvp/hdl/nrbd_nrsc_mvp.sv \
    $IPS/fpu_div_sqrt_mvp/hdl/preprocess_mvp.sv \
"

# fpnew
set SRC_FPNEW " \
    $IPS/fpnew/src/fpnew_pkg.sv \
    $IPS/fpnew/src/fpnew_cast_multi.sv \
    $IPS/fpnew/src/fpnew_classifier.sv \
    $IPS/fpnew/src/fpnew_divsqrt_multi.sv \
    $IPS/fpnew/src/fpnew_fma.sv \
    $IPS/fpnew/src/fpnew_fma_multi.sv \
    $IPS/fpnew/src/fpnew_noncomp.sv \
    $IPS/fpnew/src/fpnew_opgroup_block.sv \
    $IPS/fpnew/src/fpnew_opgroup_fmt_slice.sv \
    $IPS/fpnew/src/fpnew_opgroup_multifmt_slice.sv \
    $IPS/fpnew/src/fpnew_rounding.sv \
    $IPS/fpnew/src/fpnew_top.sv \
"
set INC_FPNEW " \
    $IPS/fpnew/../common_cells/include \
"

# jtag_pulp
set SRC_JTAG_PULP " \
    $IPS/jtag_pulp/src/bscell.sv \
    $IPS/jtag_pulp/src/jtag_axi_wrap.sv \
    $IPS/jtag_pulp/src/jtag_enable.sv \
    $IPS/jtag_pulp/src/jtag_enable_synch.sv \
    $IPS/jtag_pulp/src/jtagreg.sv \
    $IPS/jtag_pulp/src/jtag_rst_synch.sv \
    $IPS/jtag_pulp/src/jtag_sync.sv \
    $IPS/jtag_pulp/src/tap_top.v \
"
set INC_JTAG_PULP " \
    $IPS/jtag_pulp/../../rtl/includes \
"


# riscv
set SRC_RISCV " \
    $IPS/cv32e40p/./rtl/include/apu_core_package.sv \
    $IPS/cv32e40p/./rtl/include/riscv_defines.sv \
    $IPS/cv32e40p/./rtl/include/riscv_tracer_defines.sv \
    $IPS/cv32e40p/./rtl/riscv_alu.sv \
    $IPS/cv32e40p/./rtl/riscv_alu_basic.sv \
    $IPS/cv32e40p/./rtl/riscv_alu_div.sv \
    $IPS/cv32e40p/./rtl/riscv_compressed_decoder.sv \
    $IPS/cv32e40p/./rtl/riscv_controller.sv \
    $IPS/cv32e40p/./rtl/riscv_cs_registers.sv \
    $IPS/cv32e40p/./rtl/riscv_decoder.sv \
    $IPS/cv32e40p/./rtl/riscv_int_controller.sv \
    $IPS/cv32e40p/./rtl/riscv_ex_stage.sv \
    $IPS/cv32e40p/./rtl/riscv_hwloop_controller.sv \
    $IPS/cv32e40p/./rtl/riscv_hwloop_regs.sv \
    $IPS/cv32e40p/./rtl/riscv_id_stage.sv \
    $IPS/cv32e40p/./rtl/riscv_if_stage.sv \
    $IPS/cv32e40p/./rtl/riscv_load_store_unit.sv \
    $IPS/cv32e40p/./rtl/riscv_mult.sv \
    $IPS/cv32e40p/./rtl/riscv_prefetch_buffer.sv \
    $IPS/cv32e40p/./rtl/riscv_prefetch_L0_buffer.sv \
    $IPS/cv32e40p/./rtl/riscv_core.sv \
    $IPS/cv32e40p/./rtl/riscv_apu_disp.sv \
    $IPS/cv32e40p/./rtl/riscv_fetch_fifo.sv \
    $IPS/cv32e40p/./rtl/riscv_L0_buffer.sv \
    $IPS/cv32e40p/./rtl/riscv_pmp.sv \
"
set INC_RISCV " \
    $IPS/cv32e40p/./rtl/include \
    $IPS/cv32e40p/../../rtl/includes \
"



# riscv_regfile_fpga
set SRC_RISCV_REGFILE_FPGA " \
    $IPS/cv32e40p/./rtl/register_file_test_wrap.sv \
    $IPS/cv32e40p/./rtl/riscv_register_file.sv \
"
set INC_RISCV_REGFILE_FPGA " \
    $IPS/cv32e40p/./rtl/include \
"


# ibex
set SRC_IBEX " \
    $IPS/ibex/rtl/ibex_pkg.sv \
    $IPS/ibex/rtl/ibex_register_file_ff.sv \
    $IPS/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_assert.sv \
    $IPS/ibex/rtl/ibex_alu.sv \
    $IPS/ibex/rtl/ibex_compressed_decoder.sv \
    $IPS/ibex/rtl/ibex_controller.sv \
    $IPS/ibex/rtl/ibex_counter.sv \
    $IPS/ibex/rtl/ibex_csr.sv \
    $IPS/ibex/rtl/ibex_decoder.sv \
    $IPS/ibex/rtl/ibex_fetch_fifo.sv \
    $IPS/ibex/rtl/ibex_load_store_unit.sv \
    $IPS/ibex/rtl/ibex_multdiv_fast.sv \
    $IPS/ibex/rtl/ibex_multdiv_slow.sv \
    $IPS/ibex/rtl/ibex_pmp.sv \
    $IPS/ibex/rtl/ibex_wb_stage.sv \
    $IPS/ibex/rtl/ibex_cs_registers.sv \
    $IPS/ibex/rtl/ibex_ex_block.sv \
    $IPS/ibex/rtl/ibex_id_stage.sv \
    $IPS/ibex/rtl/ibex_prefetch_buffer.sv \
    $IPS/ibex/rtl/ibex_if_stage.sv \
    $IPS/ibex/rtl/ibex_core.sv \
"
set INC_IBEX " \
    $IPS/ibex/rtl \
    $IPS/ibex/vendor/lowrisc_ip/ip/prim/rtl \
"



# ibex_regfile_fpga
set SRC_IBEX_REGFILE_FPGA " \
    $IPS/ibex/rtl/ibex_register_file_fpga.sv \
"


# scm_fpga
set SRC_SCM_FPGA " \
    $IPS/scm/fpga_scm/register_file_1r_1w_all.sv \
    $IPS/scm/fpga_scm/register_file_1r_1w_be.sv \
    $IPS/scm/fpga_scm/register_file_1r_1w.sv \
    $IPS/scm/fpga_scm/register_file_1r_1w_1row.sv \
    $IPS/scm/fpga_scm/register_file_1r_1w_raw.sv \
    $IPS/scm/fpga_scm/register_file_1w_multi_port_read.sv \
    $IPS/scm/fpga_scm/register_file_1w_64b_multi_port_read_32b.sv \
    $IPS/scm/fpga_scm/register_file_1w_64b_1r_32b.sv \
    $IPS/scm/fpga_scm/register_file_2r_1w_asymm.sv \
    $IPS/scm/fpga_scm/register_file_2r_1w_asymm_test_wrap.sv \
    $IPS/scm/fpga_scm/register_file_2r_2w.sv \
    $IPS/scm/fpga_scm/register_file_3r_2w.sv \
    $IPS/scm/fpga_scm/register_file_3r_2w_be.sv \
"



# tech_cells_rtl_synth
set SRC_TECH_CELLS_RTL_SYNTH " \
    $IPS/tech_cells_generic/src/deprecated/pulp_clock_gating_async.sv \
"

# tech_cells_fpga
set SRC_TECH_CELLS_FPGA " \
    $IPS/tech_cells_generic/src/deprecated/cluster_clk_cells_xilinx.sv \
    $IPS/tech_cells_generic/src/deprecated/cluster_pwr_cells.sv \
    $IPS/tech_cells_generic/src/deprecated/pulp_clk_cells_xilinx.sv \
    $IPS/tech_cells_generic/src/deprecated/pulp_pwr_cells.sv \
    $IPS/tech_cells_generic/src/deprecated/pulp_buffer.sv \
    $IPS/tech_cells_generic/src/fpga/tc_clk_xilinx.sv \
    $IPS/tech_cells_generic/src/fpga/tc_sram_xilinx.sv \
    $IPS/tech_cells_generic/src/tc_pwr.sv \
"

# udma_core
set SRC_UDMA_CORE " \
    $IPS/udma/udma_core/rtl/common/io_clk_gen.sv \
    $IPS/udma/udma_core/rtl/common/io_event_counter.sv \
    $IPS/udma/udma_core/rtl/common/io_generic_fifo.sv \
    $IPS/udma/udma_core/rtl/common/io_shiftreg.sv \
    $IPS/udma/udma_core/rtl/common/udma_apb_if.sv \
    $IPS/udma/udma_core/rtl/common/udma_clk_div_cnt.sv \
    $IPS/udma/udma_core/rtl/common/udma_ctrl.sv \
    $IPS/udma/udma_core/rtl/common/udma_dc_fifo.sv \
    $IPS/udma/udma_core/rtl/core/udma_arbiter.sv \
    $IPS/udma/udma_core/rtl/core/udma_ch_addrgen.sv \
    $IPS/udma/udma_core/rtl/common/io_tx_fifo.sv \
    $IPS/udma/udma_core/rtl/common/io_tx_fifo_dc.sv \
    $IPS/udma/udma_core/rtl/common/io_tx_fifo_mark.sv \
    $IPS/udma/udma_core/rtl/common/udma_clkgen.sv \
    $IPS/udma/udma_core/rtl/core/udma_tx_channels.sv \
    $IPS/udma/udma_core/rtl/core/udma_stream_unit.sv \
    $IPS/udma/udma_core/rtl/core/udma_rx_channels.sv \
    $IPS/udma/udma_core/rtl/core/udma_core.sv \
"
set INC_UDMA_CORE " \
    $IPS/udma/udma_core/./rtl \
"

# udma_uart
set SRC_UDMA_UART " \
    $IPS/udma/udma_uart/rtl/udma_uart_reg_if.sv \
    $IPS/udma/udma_uart/rtl/udma_uart_rx.sv \
    $IPS/udma/udma_uart/rtl/udma_uart_tx.sv \
    $IPS/udma/udma_uart/rtl/udma_uart_top.sv \
"

# udma_i2c
set SRC_UDMA_I2C " \
    $IPS/udma/udma_i2c/rtl/udma_i2c_reg_if.sv \
    $IPS/udma/udma_i2c/rtl/udma_i2c_bus_ctrl.sv \
    $IPS/udma/udma_i2c/rtl/udma_i2c_control.sv \
    $IPS/udma/udma_i2c/rtl/udma_i2c_top.sv \
"
set INC_UDMA_I2C " \
    $IPS/udma/udma_i2c/rtl \
"

# udma_i2s
set SRC_UDMA_I2S " \
    $IPS/udma/udma_i2s/rtl/cic_comb.sv \
    $IPS/udma/udma_i2s/rtl/cic_integrator.sv \
    $IPS/udma/udma_i2s/rtl/i2s_clk_gen.sv \
    $IPS/udma/udma_i2s/rtl/i2s_rx_channel.sv \
    $IPS/udma/udma_i2s/rtl/i2s_tx_channel.sv \
    $IPS/udma/udma_i2s/rtl/i2s_ws_gen.sv \
    $IPS/udma/udma_i2s/rtl/udma_i2s_reg_if.sv \
    $IPS/udma/udma_i2s/rtl/cic_top.sv \
    $IPS/udma/udma_i2s/rtl/i2s_clkws_gen.sv \
    $IPS/udma/udma_i2s/rtl/pdm_top.sv \
    $IPS/udma/udma_i2s/rtl/i2s_txrx.sv \
    $IPS/udma/udma_i2s/rtl/udma_i2s_top.sv \
"

# udma_qspi
set SRC_UDMA_QSPI " \
    $IPS/udma/udma_qspi/rtl/udma_spim_reg_if.sv \
    $IPS/udma/udma_qspi/rtl/udma_spim_ctrl.sv \
    $IPS/udma/udma_qspi/rtl/udma_spim_txrx.sv \
    $IPS/udma/udma_qspi/rtl/udma_spim_top.sv \
"
set INC_UDMA_QSPI " \
    $IPS/udma/udma_qspi/rtl \
"

# udma_sdio
set SRC_UDMA_SDIO " \
    $IPS/udma/udma_sdio/rtl/sdio_crc7.sv \
    $IPS/udma/udma_sdio/rtl/sdio_crc16.sv \
    $IPS/udma/udma_sdio/rtl/udma_sdio_reg_if.sv \
    $IPS/udma/udma_sdio/rtl/sdio_txrx_cmd.sv \
    $IPS/udma/udma_sdio/rtl/sdio_txrx_data.sv \
    $IPS/udma/udma_sdio/rtl/sdio_txrx.sv \
    $IPS/udma/udma_sdio/rtl/udma_sdio_top.sv \
"

# udma_camera
set SRC_UDMA_CAMERA " \
    $IPS/udma/udma_camera/rtl/camera_reg_if.sv \
    $IPS/udma/udma_camera/rtl/camera_if.sv \
"

# udma_filter
set SRC_UDMA_FILTER " \
    $IPS/udma/udma_filter/rtl/udma_filter_au.sv \
    $IPS/udma/udma_filter/rtl/udma_filter_bincu.sv \
    $IPS/udma/udma_filter/rtl/udma_filter_reg_if.sv \
    $IPS/udma/udma_filter/rtl/udma_filter_rx_dataout.sv \
    $IPS/udma/udma_filter/rtl/udma_filter_tx_datafetch.sv \
    $IPS/udma/udma_filter/rtl/udma_filter.sv \
"

# udma_external_per
set SRC_UDMA_EXTERNAL_PER " \
    $IPS/udma/udma_external_per/rtl/udma_external_per_reg_if.sv \
    $IPS/udma/udma_external_per/rtl/udma_traffic_gen_rx.sv \
    $IPS/udma/udma_external_per/rtl/udma_traffic_gen_tx.sv \
    $IPS/udma/udma_external_per/rtl/udma_external_per_top.sv \
    $IPS/udma/udma_external_per/rtl/udma_external_per_wrapper.sv \
"

# udma_hyper
set SRC_UDMA_HYPER " \
    $IPS/udma_hyper/udma-hyperbus/src/cdc_fifo_gray_hyper.sv \
    $IPS/udma_hyper/udma-hyperbus/src/graycode_hyper.sv \
    $IPS/udma_hyper/udma-hyperbus/src/clock_diff_out.sv \
    $IPS/udma_hyper/udma-hyperbus/src/clk_gen_hyper.sv \
    $IPS/udma_hyper/udma-hyperbus/src/onehot_to_bin_hyper.sv \
    $IPS/udma_hyper/udma-hyperbus/src/ddr_out.sv \
    $IPS/udma_hyper/udma-hyperbus/src/hyperbus_delay_line.sv \
    $IPS/udma_hyper/udma-hyperbus/src/read_clk_rwds.sv \
    $IPS/udma_hyper/udma-hyperbus/src/hyperbus_phy.sv \
    $IPS/udma_hyper/udma-hyperbus/src/cmd_addr_gen.sv \
    $IPS/udma_hyper/udma-hyperbus/src/ddr_in.sv \
    $IPS/udma_hyper/udma-hyperbus/src/udma_hyper_reg_if_common.sv \
    $IPS/udma_hyper/udma-hyperbus/src/udma_hyper_reg_if_mulid.sv \
    $IPS/udma_hyper/udma-hyperbus/src/udma_rxbuffer.sv \
    $IPS/udma_hyper/udma-hyperbus/src/udma_txbuffer.sv \
    $IPS/udma_hyper/udma-hyperbus/src/udma_hyper_ctrl.sv \
    $IPS/udma_hyper/udma-hyperbus/src/udma_hyperbus_mulid.sv \
    $IPS/udma_hyper/udma-hyperbus/src/hyper_unpack.sv \
    $IPS/udma_hyper/udma-hyperbus/src/udma_cfg_outbuff.sv \
    $IPS/udma_hyper/udma-hyperbus/src/hyperbus_mux_generic.sv \
    $IPS/udma_hyper/udma-hyperbus/src/hyper_twd_trans_spliter.sv \
    $IPS/udma_hyper/udma-hyperbus/src/hyper_rr_flag_req.sv \
    $IPS/udma_hyper/udma-hyperbus/src/hyper_arbiter.sv \
    $IPS/udma_hyper/udma-hyperbus/src/hyper_arb_primitive.sv \
    $IPS/udma_hyper/udma-hyperbus/src/io_generic_fifo_hyper.sv \
    $IPS/udma_hyper/udma-hyperbus/src/udma_dc_fifo_hyper.sv \
    $IPS/udma_hyper/udma-hyperbus/src/dc_token_ring_fifo_din_hyper.v \
    $IPS/udma_hyper/udma-hyperbus/src/dc_token_ring_fifo_dout_hyper.v \
    $IPS/udma_hyper/udma-hyperbus/src/dc_token_ring_hyper.v \
    $IPS/udma_hyper/udma-hyperbus/src/dc_data_buffer_hyper.sv \
    $IPS/udma_hyper/udma-hyperbus/src/dc_full_detector_hyper.v \
    $IPS/udma_hyper/udma-hyperbus/src/dc_synchronizer_hyper.v \
    $IPS/udma_hyper/udma-hyperbus/src/udma_cmd_queue.sv \
    $IPS/udma_hyper/udma-hyperbus/src/udma_hyper_busy.sv \
    $IPS/udma_hyper/udma-hyperbus/src/udma_hyper_busy_phy.sv \
    $IPS/udma_hyper/udma-hyperbus/src/udma_hyper_top.sv \
"

# hwpe-ctrl
set SRC_HWPE_CTRL " \
    $IPS/hwpe-ctrl/rtl/hwpe_ctrl_package.sv \
    $IPS/hwpe-ctrl/rtl/hwpe_ctrl_interfaces.sv \
    $IPS/hwpe-ctrl/rtl/hwpe_ctrl_regfile.sv \
    $IPS/hwpe-ctrl/rtl/hwpe_ctrl_regfile_latch.sv \
    $IPS/hwpe-ctrl/rtl/hwpe_ctrl_regfile_latch_test_wrap.sv \
    $IPS/hwpe-ctrl/rtl/hwpe_ctrl_slave.sv \
    $IPS/hwpe-ctrl/rtl/hwpe_ctrl_seq_mult.sv \
    $IPS/hwpe-ctrl/rtl/hwpe_ctrl_uloop.sv \
"
set INC_HWPE_CTRL " \
    $IPS/hwpe-ctrl/rtl \
"


# hwpe-stream
set SRC_HWPE_STREAM " \
    $IPS/hwpe-stream/rtl/hwpe_stream_package.sv \
    $IPS/hwpe-stream/rtl/hwpe_stream_interfaces.sv \
    $IPS/hwpe-stream/rtl/basic/hwpe_stream_assign.sv \
    $IPS/hwpe-stream/rtl/basic/hwpe_stream_mux_static.sv \
    $IPS/hwpe-stream/rtl/basic/hwpe_stream_demux_static.sv \
    $IPS/hwpe-stream/rtl/basic/hwpe_stream_buffer.sv \
    $IPS/hwpe-stream/rtl/basic/hwpe_stream_merge.sv \
    $IPS/hwpe-stream/rtl/basic/hwpe_stream_fence.sv \
    $IPS/hwpe-stream/rtl/basic/hwpe_stream_split.sv \
    $IPS/hwpe-stream/rtl/basic/hwpe_stream_serialize.sv \
    $IPS/hwpe-stream/rtl/basic/hwpe_stream_deserialize.sv \
    $IPS/hwpe-stream/rtl/fifo/hwpe_stream_fifo_earlystall_sidech.sv \
    $IPS/hwpe-stream/rtl/fifo/hwpe_stream_fifo_earlystall.sv \
    $IPS/hwpe-stream/rtl/fifo/hwpe_stream_fifo_scm.sv \
    $IPS/hwpe-stream/rtl/fifo/hwpe_stream_fifo_scm_test_wrap.sv \
    $IPS/hwpe-stream/rtl/fifo/hwpe_stream_fifo_sidech.sv \
    $IPS/hwpe-stream/rtl/fifo/hwpe_stream_fifo.sv \
    $IPS/hwpe-stream/rtl/fifo/hwpe_stream_fifo_ctrl.sv \
    $IPS/hwpe-stream/rtl/streamer/hwpe_stream_addressgen.sv \
    $IPS/hwpe-stream/rtl/streamer/hwpe_stream_addressgen_v2.sv \
    $IPS/hwpe-stream/rtl/streamer/hwpe_stream_addressgen_v3.sv \
    $IPS/hwpe-stream/rtl/streamer/hwpe_stream_strbgen.sv \
    $IPS/hwpe-stream/rtl/streamer/hwpe_stream_sink.sv \
    $IPS/hwpe-stream/rtl/streamer/hwpe_stream_sink_realign.sv \
    $IPS/hwpe-stream/rtl/streamer/hwpe_stream_source.sv \
    $IPS/hwpe-stream/rtl/streamer/hwpe_stream_source_realign.sv \
    $IPS/hwpe-stream/rtl/streamer/hwpe_stream_streamer_queue.sv \
    $IPS/hwpe-stream/rtl/tcdm/hwpe_stream_tcdm_fifo_load.sv \
    $IPS/hwpe-stream/rtl/tcdm/hwpe_stream_tcdm_fifo_load_sidech.sv \
    $IPS/hwpe-stream/rtl/tcdm/hwpe_stream_tcdm_fifo_store.sv \
    $IPS/hwpe-stream/rtl/tcdm/hwpe_stream_tcdm_fifo.sv \
    $IPS/hwpe-stream/rtl/tcdm/hwpe_stream_tcdm_assign.sv \
    $IPS/hwpe-stream/rtl/tcdm/hwpe_stream_tcdm_mux.sv \
    $IPS/hwpe-stream/rtl/tcdm/hwpe_stream_tcdm_mux_static.sv \
    $IPS/hwpe-stream/rtl/tcdm/hwpe_stream_tcdm_reorder.sv \
    $IPS/hwpe-stream/rtl/tcdm/hwpe_stream_tcdm_reorder_static.sv \
"
set INC_HWPE_STREAM " \
    $IPS/hwpe-stream/rtl \
"



# hw-mac-engine
set SRC_HW_MAC_ENGINE " \
    $IPS/hwpe-mac-engine/rtl/mac_package.sv \
    $IPS/hwpe-mac-engine/rtl/mac_fsm.sv \
    $IPS/hwpe-mac-engine/rtl/mac_ctrl.sv \
    $IPS/hwpe-mac-engine/rtl/mac_streamer.sv \
    $IPS/hwpe-mac-engine/rtl/mac_engine.sv \
    $IPS/hwpe-mac-engine/rtl/mac_top.sv \
    $IPS/hwpe-mac-engine/wrap/mac_top_wrap.sv \
"
set INC_HW_MAC_ENGINE " \
    $IPS/hwpe-mac-engine/rtl \
"

# riscv-dbg
set SRC_RISCV_DBG " \
    $IPS/riscv-dbg/src/dm_pkg.sv \
    $IPS/riscv-dbg/debug_rom/debug_rom.sv \
    $IPS/riscv-dbg/debug_rom/debug_rom_one_scratch.sv \
    $IPS/riscv-dbg/src/dm_csrs.sv \
    $IPS/riscv-dbg/src/dm_mem.sv \
    $IPS/riscv-dbg/src/dm_top.sv \
    $IPS/riscv-dbg/src/dm_obi_top.sv \
    $IPS/riscv-dbg/src/dmi_cdc.sv \
    $IPS/riscv-dbg/src/dmi_jtag.sv \
    $IPS/riscv-dbg/src/dmi_jtag_tap.sv \
    $IPS/riscv-dbg/src/dm_sba.sv \
"

# register_interface
set SRC_REGISTER_INTERFACE " \
    $IPS/register_interface/src/reg_intf.sv \
    $IPS/register_interface/src/apb_to_reg.sv \
    $IPS/register_interface/src/axi_to_reg.sv \
    $IPS/register_interface/src/periph_to_reg.sv \
    $IPS/register_interface/src/reg_cdc.sv \
    $IPS/register_interface/src/reg_demux.sv \
    $IPS/register_interface/src/reg_mux.sv \
    $IPS/register_interface/src/reg_to_mem.sv \
    $IPS/register_interface/src/reg_uniform.sv \
    $IPS/register_interface/src/axi_lite_to_reg.sv \
"
set INC_REGISTER_INTERFACE " \
    $IPS/register_interface/include \
    $IPS/register_interface/../axi/axi/include \
    $IPS/register_interface/../common_cells/include \
"

# reggen_primitives
set SRC_REGGEN_PRIMITIVES " \
    $IPS/register_interface/vendor/lowrisc_opentitan/src/prim_subreg.sv \
    $IPS/register_interface/vendor/lowrisc_opentitan/src/prim_subreg_arb.sv \
    $IPS/register_interface/vendor/lowrisc_opentitan/src/prim_subreg_ext.sv \
    $IPS/register_interface/vendor/lowrisc_opentitan/src/prim_subreg_shadow.sv \
"
set INC_REGGEN_PRIMITIVES " \
    $IPS/register_interface/include \
    $IPS/register_interface/../axi/axi/include \
    $IPS/register_interface/../common_cells/include \
"


# pulp_soc
set SRC_PULP_SOC " \
    $IPS/pulp_soc/rtl/pulp_soc/pkg_soc_interconnect.sv \
    $IPS/pulp_soc/rtl/pulp_soc/axi64_2_lint32_wrap.sv \
    $IPS/pulp_soc/rtl/pulp_soc/lint_2_axi_wrap.sv \
    $IPS/pulp_soc/rtl/pulp_soc/contiguous_crossbar.sv \
    $IPS/pulp_soc/rtl/pulp_soc/interleaved_crossbar.sv \
    $IPS/pulp_soc/rtl/pulp_soc/tcdm_demux.sv \
    $IPS/pulp_soc/rtl/pulp_soc/boot_rom.sv \
    $IPS/pulp_soc/rtl/pulp_soc/l2_ram_multi_bank.sv \
    $IPS/pulp_soc/rtl/pulp_soc/lint_jtag_wrap.sv \
    $IPS/pulp_soc/rtl/pulp_soc/periph_bus_wrap.sv \
    $IPS/pulp_soc/rtl/pulp_soc/soc_clk_rst_gen.sv \
    $IPS/pulp_soc/rtl/pulp_soc/soc_event_arbiter.sv \
    $IPS/pulp_soc/rtl/pulp_soc/soc_event_generator.sv \
    $IPS/pulp_soc/rtl/pulp_soc/soc_event_queue.sv \
    $IPS/pulp_soc/rtl/pulp_soc/tcdm_error_slave.sv \
    $IPS/pulp_soc/rtl/pulp_soc/soc_interconnect.sv \
    $IPS/pulp_soc/rtl/pulp_soc/soc_interconnect_wrap.sv \
    $IPS/pulp_soc/rtl/pulp_soc/soc_peripherals.sv \
    $IPS/pulp_soc/rtl/pulp_soc/pulp_soc.sv \
"
set INC_PULP_SOC " \
    $IPS/pulp_soc/../../rtl/includes \
    $IPS/pulp_soc/rtl/include \
    $IPS/pulp_soc/../axi/axi/include \
"

# udma_subsystem
set SRC_UDMA_SUBSYSTEM " \
    $IPS/pulp_soc/rtl/udma_subsystem/udma_subsystem.sv \
"
set INC_UDMA_SUBSYSTEM " \
    $IPS/pulp_soc/../../rtl/includes \
    $IPS/pulp_soc/. \
"

# fc
set SRC_FC " \
    $IPS/pulp_soc/rtl/fc/fc_demux.sv \
    $IPS/pulp_soc/rtl/fc/fc_subsystem.sv \
    $IPS/pulp_soc/rtl/fc/fc_hwpe.sv \
"
set INC_FC " \
    $IPS/pulp_soc/../../rtl/includes \
    $IPS/pulp_soc/. \
"

# components
set SRC_COMPONENTS " \
    $IPS/pulp_soc/rtl/components/apb_clkdiv.sv \
    $IPS/pulp_soc/rtl/components/apb_soc_ctrl.sv \
    $IPS/pulp_soc/rtl/components/memory_models.sv \
    $IPS/pulp_soc/rtl/components/pulp_interfaces.sv \
    $IPS/pulp_soc/rtl/components/glitch_free_clk_mux.sv \
    $IPS/pulp_soc/rtl/components/scm_2048x32.sv \
    $IPS/pulp_soc/rtl/components/scm_512x32.sv \
    $IPS/pulp_soc/rtl/components/tcdm_arbiter_2x1.sv \
    $IPS/pulp_soc/rtl/components/obi_pulp_adapter.sv \
    $IPS/pulp_soc/rtl/components/apb_intf.sv \
"
set INC_COMPONENTS " \
    $IPS/pulp_soc/../../rtl/includes \
"



# axi2mem
set SRC_AXI2MEM " \
    $IPS/axi/axi2mem/axi2mem_busy_unit.sv \
    $IPS/axi/axi2mem/axi2mem_rd_channel.sv \
    $IPS/axi/axi2mem/axi2mem.sv \
    $IPS/axi/axi2mem/axi2mem_tcdm_rd_if.sv \
    $IPS/axi/axi2mem/axi2mem_tcdm_synch.sv \
    $IPS/axi/axi2mem/axi2mem_tcdm_unit.sv \
    $IPS/axi/axi2mem/axi2mem_tcdm_wr_if.sv \
    $IPS/axi/axi2mem/axi2mem_trans_unit.sv \
    $IPS/axi/axi2mem/axi2mem_wr_channel.sv \
"

# per2axi
set SRC_PER2AXI " \
    $IPS/axi/per2axi/src/per2axi_busy_unit.sv \
    $IPS/axi/per2axi/src/per2axi_req_channel.sv \
    $IPS/axi/per2axi/src/per2axi_res_channel.sv \
    $IPS/axi/per2axi/src/per2axi.sv \
"

# hci
set SRC_HCI " \
    $IPS/hci/rtl/common/hci_package.sv \
    $IPS/hci/rtl/common/hci_interfaces.sv \
    $IPS/hci/rtl/interco/hci_log_interconnect.sv \
    $IPS/hci/rtl/interco/hci_log_interconnect_l2.sv \
    $IPS/hci/rtl/interco/hci_new_log_interconnect.sv \
    $IPS/hci/rtl/hci_interconnect.sv \
    $IPS/hci/rtl/interco/hci_hwpe_interconnect.sv \
    $IPS/hci/rtl/interco/hci_shallow_interconnect.sv \
    $IPS/hci/rtl/core/hci_core_fifo.sv \
    $IPS/hci/rtl/core/hci_core_assign.sv \
    $IPS/hci/rtl/core/hci_core_memmap_filter.sv \
    $IPS/hci/rtl/core/hci_core_memmap_demux_interl.sv \
    $IPS/hci/rtl/core/hci_core_sink.sv \
    $IPS/hci/rtl/core/hci_core_source.sv \
    $IPS/hci/rtl/core/hci_core_mux_static.sv \
    $IPS/hci/rtl/core/hci_core_mux_dynamic.sv \
    $IPS/hci/rtl/core/hci_core_load_store_mixer.sv \
    $IPS/hci/rtl/core/hci_core_r_valid_filter.sv \
    $IPS/hci/rtl/core/hci_core_cmd_queue.sv \
    $IPS/hci/rtl/core/hci_core_split.sv \
    $IPS/hci/rtl/mem/hci_mem_assign.sv \
"

# fpu_interco
set SRC_FPU_INTERCO " \
    $IPS/fpu_interco/../cv32e40p/rtl/include/riscv_defines.sv \
    $IPS/fpu_interco/FP_WRAP/fp_iter_divsqrt_msv_wrapper_2_STAGE.sv \
    $IPS/fpu_interco/FP_WRAP/fpnew_wrapper.sv \
    $IPS/fpu_interco/RTL/AddressDecoder_Req_FPU.sv \
    $IPS/fpu_interco/RTL/AddressDecoder_Resp_FPU.sv \
    $IPS/fpu_interco/RTL/ArbitrationTree_FPU.sv \
    $IPS/fpu_interco/RTL/FanInPrimitive_Req_FPU.sv \
    $IPS/fpu_interco/RTL/FanInPrimitive_Resp_FPU.sv \
    $IPS/fpu_interco/RTL/optimal_alloc.sv \
    $IPS/fpu_interco/RTL/FPU_clock_gating.sv \
    $IPS/fpu_interco/RTL/LFSR_FPU.sv \
    $IPS/fpu_interco/RTL/RequestBlock_FPU.sv \
    $IPS/fpu_interco/RTL/ResponseBlock_FPU.sv \
    $IPS/fpu_interco/RTL/ResponseTree_FPU.sv \
    $IPS/fpu_interco/RTL/RR_Flag_Req_FPU.sv \
    $IPS/fpu_interco/RTL/shared_fpu_cluster.sv \
    $IPS/fpu_interco/RTL/fpu_demux.sv \
    $IPS/fpu_interco/RTL/XBAR_FPU.sv \
"
set INC_FPU_INTERCO " \
    $IPS/fpu_interco/../cv32e40p/rtl/include \
"

# pulp_cluster
set SRC_PULP_CLUSTER " \
    $IPS/pulp_cluster/../axi/axi/include/axi/typedef.svh \
    $IPS/pulp_cluster/packages/pulp_cluster_package.sv \
    $IPS/pulp_cluster/rtl/instr_width_converter.sv \
    $IPS/pulp_cluster/rtl/core_region.sv \
    $IPS/pulp_cluster/rtl/core_demux.sv \
    $IPS/pulp_cluster/rtl/periph_demux.sv \
    $IPS/pulp_cluster/rtl/cluster_interconnect_wrap.sv \
    $IPS/pulp_cluster/rtl/tcdm_banks_wrap.sv \
    $IPS/pulp_cluster/rtl/per_demux_wrap.sv \
    $IPS/pulp_cluster/rtl/periph_FIFO.sv \
    $IPS/pulp_cluster/rtl/xbar_pe_wrap.sv \
    $IPS/pulp_cluster/rtl/cluster_peripherals.sv \
    $IPS/pulp_cluster/rtl/cluster_clock_gate.sv \
    $IPS/pulp_cluster/rtl/cluster_timer_wrap.sv \
    $IPS/pulp_cluster/rtl/cluster_event_map.sv \
    $IPS/pulp_cluster/rtl/dmac_wrap.sv \
    $IPS/pulp_cluster/rtl/hwpe_subsystem.sv \
    $IPS/pulp_cluster/rtl/cluster_bus_wrap.sv \
    $IPS/pulp_cluster/rtl/axi2mem_wrap.sv \
    $IPS/pulp_cluster/rtl/axi2per_wrap.sv \
    $IPS/pulp_cluster/rtl/per2axi_wrap.sv \
    $IPS/pulp_cluster/rtl/pulp_cluster.sv \
    $IPS/pulp_cluster/../pulp_soc/rtl/components/pulp_interfaces.sv \
"
set INC_PULP_CLUSTER " \
    $IPS/pulp_cluster/../../rtl/includes \
    $IPS/pulp_cluster/packages \
    $IPS/pulp_cluster/../axi/axi/include \
    $IPS/pulp_cluster/../axi/axi/include/axi \
"

