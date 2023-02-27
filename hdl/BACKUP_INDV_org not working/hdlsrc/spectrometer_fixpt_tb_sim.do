onbreak resume
onerror resume
vsim -voptargs=+acc work.spectrometer_fixpt_tb

add wave sim:/spectrometer_fixpt_tb/u_spectrometer_fixpt/clk
add wave sim:/spectrometer_fixpt_tb/u_spectrometer_fixpt/reset
add wave sim:/spectrometer_fixpt_tb/u_spectrometer_fixpt/clk_enable
add wave sim:/spectrometer_fixpt_tb/u_spectrometer_fixpt/sample1
add wave sim:/spectrometer_fixpt_tb/u_spectrometer_fixpt/sample2
add wave sim:/spectrometer_fixpt_tb/u_spectrometer_fixpt/ce_out
add wave sim:/spectrometer_fixpt_tb/u_spectrometer_fixpt/pks
add wave sim:/spectrometer_fixpt_tb/pks_ref
add wave sim:/spectrometer_fixpt_tb/u_spectrometer_fixpt/outbin
add wave sim:/spectrometer_fixpt_tb/outbin_ref
add wave sim:/spectrometer_fixpt_tb/u_spectrometer_fixpt/ready
add wave sim:/spectrometer_fixpt_tb/ready_ref
set ::dut_prefix /spectrometer_fixpt_tb/u_
do spectrometer_fixpt_noresetinitscript.tcl
run -all
