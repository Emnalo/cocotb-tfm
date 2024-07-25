onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal /bench_alu/bus_a
add wave -noupdate -format Literal /bench_alu/bus_b
add wave -noupdate -format Literal /bench_alu/bus_out
add wave -noupdate -format Logic /bench_alu/carry_new
add wave -noupdate -format Logic /bench_alu/carry_old
add wave -noupdate -format Logic /bench_alu/zero
add wave -noupdate -format Literal /bench_alu/alu_op
add wave -noupdate -format Logic /bench_alu/reset
add wave -noupdate -format Literal /bench_alu/alu/bit_test
add wave -noupdate -format Literal /bench_alu/alu/bit_pattern
add wave -noupdate -format Literal /bench_alu/alu/result
add wave -noupdate -format Logic /bench_alu/alu/temp_carry
add wave -noupdate -format Literal /bench_alu/alu/temp_b
add wave -noupdate -format Logic /bench_alu/alu/zero
add wave -noupdate -format Logic /bench_alu/alu/carry_out
add wave -noupdate -format Logic /bench_alu/alu/carry_in
add wave -noupdate -format Literal /bench_alu/alu/res
add wave -noupdate -format Literal /bench_alu/alu/b
add wave -noupdate -format Literal /bench_alu/alu/a
add wave -noupdate -format Literal /bench_alu/alu/operation
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {39 ns}
WaveRestoreZoom {0 ns} {1426 ns}
configure wave -namecolwidth 184
configure wave -valuecolwidth 72
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0


run 1000 ns