quietly set ACTELLIBNAME PolarFire
quietly set PROJECT_DIR "C:/share/LuSEE/FPGA/PF_EVAL_TEST"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap PolarFire "C:/Microchip/Libero_SoC_v2022.3/Designer/lib/modelsimpro/precompiled/vlog/PolarFire"
if {[file exists COREUART_LIB/_info]} {
   echo "INFO: Simulation library COREUART_LIB already exists"
} else {
   file delete -force COREUART_LIB 
   vlib COREUART_LIB
}
vmap COREUART_LIB "COREUART_LIB"
if {[file exists COREFIFO_LIB/_info]} {
   echo "INFO: Simulation library COREFIFO_LIB already exists"
} else {
   file delete -force COREFIFO_LIB 
   vlib COREFIFO_LIB
}
vmap COREFIFO_LIB "COREFIFO_LIB"

vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_CTRL1_1.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_CTRL1_10.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_CTRL1_11.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_CTRL1_12.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_CTRL1_2.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_CTRL1_3.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_CTRL1_4.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_CTRL1_5.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_CTRL1_6.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_CTRL1_7.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_CTRL1_8.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_CTRL1_9.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/SimpleDualPortRAM_generic.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/SDFCommutator1.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_SDF1_1.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/SDFCommutator11.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Multiply_generic.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Complex4Multiply_generic.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_SDF1_11.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/SDFCommutator3.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_SDF1_3.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/SDFCommutator5.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_SDF1_5.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/SDFCommutator7.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_SDF1_7.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/SDFCommutator9.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_SDF1_9.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/SDFCommutator10.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_SDF2_10.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/SDFCommutator12.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_SDF2_12.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/SDFCommutator2.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_SDF2_2.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/SDFCommutator4.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_SDF2_4.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/SDFCommutator6.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_SDF2_6.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/SDFCommutator8.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX22FFT_SDF2_8.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RADIX2FFT_bitNatural.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/spectrometer_fixpt_pkg.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/TWDLROM_11_1.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/TWDLROM_11_1_array.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/TWDLROM_3_1.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/TWDLROM_5_1.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/TWDLROM_7_1.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/TWDLROM_9_1.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/dsphdl_FFT.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/sfft_fixpt.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/Actel/DirectCore/COREFIFO/3.0.101/rtl/vhdl/core/fifo_pkg.vhd"
vcom -2008 -explicit  -work COREUART_LIB "${PROJECT_DIR}/component/work/COREUART_C0/COREUART_C0_0/rtl/vhdl/core/components.vhd"
vcom -2008 -explicit  -work COREUART_LIB "${PROJECT_DIR}/component/work/COREUART_C0/COREUART_C0_0/rtl/vhdl/core/coreuart_pkg.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/LuSEE_Pkg.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/sfft_fixpt_pkg.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/weight_streamer_fixpt_pkg.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/FFT_TST.vhd"

vsim -L PolarFire -L presynth -L COREUART_LIB -L COREFIFO_LIB  -t 1ps -pli C:/Microchip/Libero_SoC_v2022.3/Designer/lib/modelsimpro/pli/pf_crypto_win_me_pli.dll presynth.FFT_TST
add wave /FFT_TST/*
run 1000ns
