onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group control /tb_pll_control/pll_control/clk
add wave -noupdate -expand -group control /tb_pll_control/pll_control/reset
add wave -noupdate -expand -group control /tb_pll_control/pll_control/mgmt_readdata
add wave -noupdate -expand -group control /tb_pll_control/pll_control/mgmt_waitrequest
add wave -noupdate -expand -group control /tb_pll_control/pll_control/sw_in
add wave -noupdate -expand -group control /tb_pll_control/pll_control/mgmt_read
add wave -noupdate -expand -group control /tb_pll_control/pll_control/mgmt_write
add wave -noupdate -expand -group control /tb_pll_control/pll_control/mgmt_address
add wave -noupdate -expand -group control /tb_pll_control/pll_control/mgmt_writedata
add wave -noupdate -expand -group control /tb_pll_control/pll_control/state
add wave -noupdate -expand -group control /tb_pll_control/pll_control/write_count
add wave -noupdate -expand -group control /tb_pll_control/pll_control/mgmt_read_reg
add wave -noupdate -expand -group control /tb_pll_control/pll_control/mgmt_write_reg
add wave -noupdate -expand -group control /tb_pll_control/pll_control/mgmt_address_reg
add wave -noupdate -expand -group control /tb_pll_control/pll_control/mgmt_writedata_reg
add wave -noupdate -expand -group reconfig /tb_pll_control/pll_reconfig_inst/mgmt_clk
add wave -noupdate -expand -group reconfig /tb_pll_control/pll_reconfig_inst/mgmt_reset
add wave -noupdate -expand -group reconfig /tb_pll_control/pll_reconfig_inst/mgmt_waitrequest
add wave -noupdate -expand -group reconfig /tb_pll_control/pll_reconfig_inst/mgmt_read
add wave -noupdate -expand -group reconfig /tb_pll_control/pll_reconfig_inst/mgmt_write
add wave -noupdate -expand -group reconfig /tb_pll_control/pll_reconfig_inst/mgmt_readdata
add wave -noupdate -expand -group reconfig /tb_pll_control/pll_reconfig_inst/mgmt_address
add wave -noupdate -expand -group reconfig /tb_pll_control/pll_reconfig_inst/mgmt_writedata
add wave -noupdate -expand -group reconfig /tb_pll_control/pll_reconfig_inst/reconfig_to_pll
add wave -noupdate -expand -group reconfig /tb_pll_control/pll_reconfig_inst/reconfig_from_pll
add wave -noupdate -expand -group PLL /tb_pll_control/pll_inst/refclk
add wave -noupdate -expand -group PLL /tb_pll_control/pll_inst/rst
add wave -noupdate -expand -group PLL /tb_pll_control/pll_inst/outclk_0
add wave -noupdate -expand -group PLL /tb_pll_control/pll_inst/locked
add wave -noupdate -expand -group PLL /tb_pll_control/pll_inst/reconfig_to_pll
add wave -noupdate -expand -group PLL /tb_pll_control/pll_inst/reconfig_from_pll
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {346154 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 286
configure wave -valuecolwidth 207
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
configure wave -timelineunits ps
update
WaveRestoreZoom {110337 ps} {766587 ps}
