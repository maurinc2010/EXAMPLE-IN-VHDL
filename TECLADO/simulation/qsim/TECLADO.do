onerror {quit -f}
vlib work
vlog -work work TECLADO.vo
vlog -work work TECLADO.vt
vsim -novopt -c -t 1ps -L max3000a_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.TECLADO_vlg_vec_tst
vcd file -direction TECLADO.msim.vcd
vcd add -internal TECLADO_vlg_vec_tst/*
vcd add -internal TECLADO_vlg_vec_tst/i1/*
add wave /*
run -all
