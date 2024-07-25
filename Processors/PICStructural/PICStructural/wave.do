onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /pic_core_test/top/reset
add wave -noupdate -format Logic /pic_core_test/top/clock
add wave -noupdate -format Literal /pic_core_test/top/program_counter/pc
add wave -noupdate -format Literal -radix decimal /pic_core_test/top/working_register/value
add wave -noupdate -format Literal -radix decimal /pic_core_test/top/register_file/r8
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {1449 ns}
WaveRestoreZoom {5447 ns} {7951 ns}
configure wave -namecolwidth 251
configure wave -valuecolwidth 86
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
