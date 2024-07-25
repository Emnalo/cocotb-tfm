onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /bench/reset
add wave -noupdate /bench/clock
add wave -noupdate -radix decimal /bench/top/addr_bus_s
add wave -noupdate /bench/top/we_s
add wave -noupdate /bench/top/wr_data_bus_s
add wave -noupdate /bench/top/rd_data_bus_s
add wave -noupdate /bench/top/cpu/estado
add wave -noupdate /bench/top/cpu/cp_reg_s
add wave -noupdate /bench/top/cpu/co_reg_s
add wave -noupdate /bench/top/cpu/cd_reg_s
add wave -noupdate /bench/top/cpu/ac_reg_s
add wave -noupdate -radix decimal /bench/top/ram/ram(0)
add wave -noupdate -radix decimal /bench/top/ram/ram(1)
add wave -noupdate -radix decimal /bench/top/ram/ram(2)
add wave -noupdate -radix decimal /bench/top/ram/ram(3)
add wave -noupdate -radix decimal /bench/top/ram/ram(4)
add wave -noupdate /bench/top/ram/ram(5)
add wave -noupdate /bench/top/ram/ram(6)
add wave -noupdate /bench/top/ram/ram(7)
add wave -noupdate /bench/top/ram/ram(8)
add wave -noupdate /bench/top/ram/ram(9)
add wave -noupdate /bench/top/ram/ram(10)
add wave -noupdate /bench/top/ram/ram(11)
add wave -noupdate /bench/top/ram/ram(12)
add wave -noupdate /bench/top/ram/ram(13)
add wave -noupdate /bench/top/ram/ram(14)
add wave -noupdate /bench/top/ram/ram(15)
add wave -noupdate -radix unsigned /bench/top/ram/ram(100)
add wave -noupdate -radix unsigned /bench/top/ram/ram(99)
add wave -noupdate -radix unsigned /bench/top/ram/ram(98)
add wave -noupdate -radix unsigned /bench/top/ram/ram(97)
add wave -noupdate -radix unsigned /bench/top/ram/ram(96)
add wave -noupdate -radix unsigned /bench/top/ram/ram(95)
add wave -noupdate -radix unsigned /bench/top/ram/ram(94)
add wave -noupdate -radix unsigned /bench/top/ram/ram(93)
add wave -noupdate -radix unsigned /bench/top/ram/ram(92)
add wave -noupdate -radix unsigned /bench/top/ram/ram(91)
add wave -noupdate -radix unsigned /bench/top/ram/ram(90)
add wave -noupdate -radix unsigned /bench/top/ram/ram(89)
add wave -noupdate -radix unsigned /bench/top/ram/ram(88)
add wave -noupdate -radix unsigned /bench/top/ram/ram(87)
add wave -noupdate -radix unsigned /bench/top/ram/ram(86)
add wave -noupdate -radix unsigned /bench/top/ram/ram(85)
add wave -noupdate -radix unsigned /bench/top/ram/ram(84)
add wave -noupdate -radix unsigned /bench/top/ram/ram(83)
add wave -noupdate -radix unsigned /bench/top/ram/ram(82)
add wave -noupdate -radix unsigned /bench/top/ram/ram(81)
add wave -noupdate -radix unsigned /bench/top/ram/ram(80)
add wave -noupdate -radix unsigned /bench/top/ram/ram(79)
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 183
configure wave -valuecolwidth 64
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {9758 ns} {10013 ns}
