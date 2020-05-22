vlog -work work C:/Users/DECI/Documents/example vhdl/EXAMPLE-IN-VHDL/SEMAFORO_CRUCE/simulation/modelsim/Waveform.vwf.vt
vsim -novopt -c -t 1ps -L maxv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.SEMAFORO_vlg_vec_tst
onerror {resume}
add wave {SEMAFORO_vlg_vec_tst/i1/carretera}
add wave {SEMAFORO_vlg_vec_tst/i1/carretera[2]}
add wave {SEMAFORO_vlg_vec_tst/i1/carretera[1]}
add wave {SEMAFORO_vlg_vec_tst/i1/carretera[0]}
add wave {SEMAFORO_vlg_vec_tst/i1/clk_1s}
add wave {SEMAFORO_vlg_vec_tst/i1/reset}
add wave {SEMAFORO_vlg_vec_tst/i1/rural}
add wave {SEMAFORO_vlg_vec_tst/i1/rural[2]}
add wave {SEMAFORO_vlg_vec_tst/i1/rural[1]}
add wave {SEMAFORO_vlg_vec_tst/i1/rural[0]}
add wave {SEMAFORO_vlg_vec_tst/i1/sensor}
run -all
