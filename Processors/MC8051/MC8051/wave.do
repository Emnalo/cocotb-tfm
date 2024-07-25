onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /TbTop/clk
add wave -noupdate -radix hexadecimal /TbTop/reset
add wave -noupdate -radix hexadecimal /TbTop/cnt
add wave -noupdate -radix hexadecimal /TbTop/cycle
add wave -noupdate -radix hexadecimal /TbTop/Din_p0
add wave -noupdate -radix hexadecimal /TbTop/Din_p3
add wave -noupdate -radix hexadecimal /TbTop/Intvec
add wave -noupdate -radix hexadecimal /TbTop/p1_o
add wave -noupdate -radix hexadecimal /TbTop/p2_o
add wave -noupdate -radix hexadecimal /TbTop/FinishFlag
add wave -noupdate -radix hexadecimal -childformat {{{/TbTop/RES[19]} -radix hexadecimal} {{/TbTop/RES[18]} -radix hexadecimal} {{/TbTop/RES[17]} -radix hexadecimal} {{/TbTop/RES[16]} -radix hexadecimal} {{/TbTop/RES[15]} -radix hexadecimal} {{/TbTop/RES[14]} -radix hexadecimal} {{/TbTop/RES[13]} -radix hexadecimal} {{/TbTop/RES[12]} -radix hexadecimal} {{/TbTop/RES[11]} -radix hexadecimal} {{/TbTop/RES[10]} -radix hexadecimal} {{/TbTop/RES[9]} -radix hexadecimal} {{/TbTop/RES[8]} -radix hexadecimal} {{/TbTop/RES[7]} -radix hexadecimal} {{/TbTop/RES[6]} -radix hexadecimal} {{/TbTop/RES[5]} -radix hexadecimal} {{/TbTop/RES[4]} -radix hexadecimal} {{/TbTop/RES[3]} -radix hexadecimal} {{/TbTop/RES[2]} -radix hexadecimal} {{/TbTop/RES[1]} -radix hexadecimal} {{/TbTop/RES[0]} -radix hexadecimal}} -subitemconfig {{/TbTop/RES[19]} {-radix hexadecimal} {/TbTop/RES[18]} {-radix hexadecimal} {/TbTop/RES[17]} {-radix hexadecimal} {/TbTop/RES[16]} {-radix hexadecimal} {/TbTop/RES[15]} {-radix hexadecimal} {/TbTop/RES[14]} {-radix hexadecimal} {/TbTop/RES[13]} {-radix hexadecimal} {/TbTop/RES[12]} {-radix hexadecimal} {/TbTop/RES[11]} {-radix hexadecimal} {/TbTop/RES[10]} {-radix hexadecimal} {/TbTop/RES[9]} {-radix hexadecimal} {/TbTop/RES[8]} {-radix hexadecimal} {/TbTop/RES[7]} {-radix hexadecimal} {/TbTop/RES[6]} {-radix hexadecimal} {/TbTop/RES[5]} {-radix hexadecimal} {/TbTop/RES[4]} {-radix hexadecimal} {/TbTop/RES[3]} {-radix hexadecimal} {/TbTop/RES[2]} {-radix hexadecimal} {/TbTop/RES[1]} {-radix hexadecimal} {/TbTop/RES[0]} {-radix hexadecimal}} /TbTop/RES
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1970092751 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {1612375 ns} {2137375 ns}
