onerror {quit -f}
vlib work
vlog -work work DSP_FPGA_IMC_PMSM.vo
vlog -work work DSP_FPGA_IMC_PMSM.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.DSP_FPGA_IMC_PMSM_vlg_vec_tst
vcd file -direction DSP_FPGA_IMC_PMSM.msim.vcd
vcd add -internal DSP_FPGA_IMC_PMSM_vlg_vec_tst/*
vcd add -internal DSP_FPGA_IMC_PMSM_vlg_vec_tst/i1/*
add wave /*
run -all
