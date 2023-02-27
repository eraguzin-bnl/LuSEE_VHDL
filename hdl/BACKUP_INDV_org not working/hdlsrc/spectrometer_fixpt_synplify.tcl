project -new spectrometer_fixpt.prj
add_file spectrometer_fixpt_pkg.vhd
add_file SimpleDualPortRAM_generic.vhd
add_file SDFCommutator1.vhd
add_file RADIX22FFT_SDF1_1.vhd
add_file RADIX22FFT_CTRL1_1.vhd
add_file SDFCommutator2.vhd
add_file RADIX22FFT_SDF2_2.vhd
add_file RADIX22FFT_CTRL1_2.vhd
add_file TWDLROM_3_1.vhd
add_file Complex4Multiply.vhd
add_file SDFCommutator3.vhd
add_file RADIX22FFT_SDF1_3.vhd
add_file RADIX22FFT_CTRL1_3.vhd
add_file SDFCommutator4.vhd
add_file RADIX22FFT_SDF2_4.vhd
add_file RADIX22FFT_CTRL1_4.vhd
add_file TWDLROM_5_1.vhd
add_file Complex4Multiply_block.vhd
add_file SDFCommutator5.vhd
add_file RADIX22FFT_SDF1_5.vhd
add_file RADIX22FFT_CTRL1_5.vhd
add_file SDFCommutator6.vhd
add_file RADIX22FFT_SDF2_6.vhd
add_file RADIX22FFT_CTRL1_6.vhd
add_file TWDLROM_7_1.vhd
add_file Complex4Multiply_block1.vhd
add_file SDFCommutator7.vhd
add_file RADIX22FFT_SDF1_7.vhd
add_file RADIX22FFT_CTRL1_7.vhd
add_file SDFCommutator8.vhd
add_file RADIX22FFT_SDF2_8.vhd
add_file RADIX22FFT_CTRL1_8.vhd
add_file TWDLROM_9_1.vhd
add_file Complex4Multiply_block2.vhd
add_file SDFCommutator9.vhd
add_file RADIX22FFT_SDF1_9.vhd
add_file RADIX22FFT_CTRL1_9.vhd
add_file SDFCommutator10.vhd
add_file RADIX22FFT_SDF2_10.vhd
add_file RADIX22FFT_CTRL1_10.vhd
add_file TWDLROM_11_1.vhd
add_file Complex4Multiply_block3.vhd
add_file SDFCommutator11.vhd
add_file RADIX22FFT_SDF1_11.vhd
add_file RADIX22FFT_CTRL1_11.vhd
add_file SDFCommutator12.vhd
add_file RADIX22FFT_SDF2_12.vhd
add_file RADIX22FFT_CTRL1_12.vhd
add_file RADIX2FFT_bitNatural.vhd
add_file dsphdl_FFT.vhd
add_file SimpleDualPortRAM_generic_block.vhd
add_file spectrometer_fixpt.vhd
set_option -technology VIRTEX4
set_option -part XC4VSX35
set_option -synthesis_onoff_pragma 0
set_option -frequency auto
project -run synthesis
