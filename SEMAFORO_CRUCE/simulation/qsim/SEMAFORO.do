onerror {quit -f}
vlib work
vlog -work work SEMAFORO.vo
vlog -work work SEMAFORO.vt
vsim -novopt -c -t 1ps -L maxv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.SEMAFORO_vlg_vec_tst
vcd file -direction SEMAFORO.msim.vcd
vcd add -internal SEMAFORO_vlg_vec_tst/*
vcd add -internal SEMAFORO_vlg_vec_tst/i1/*
add wave /*
run -all
