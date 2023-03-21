echo "Here we are in Eric's LuSEE DO file"
echo $1
echo $2

quietly set ACTELLIBNAME PolarFire
quietly set PROJECT_DIR $2

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap PolarFire "$1/lib/modelsimpro/precompiled/vlog/polarfire"
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

vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vhdl/core/corefifo_fwft.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/Actel/DirectCore/COREFIFO/3.0.101/rtl/vhdl/core/fifo_pkg.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vhdl/core/corefifo_sync_scntr.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vhdl/core/corefifo_sync.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vhdl/core/corefifo_NstagesSync.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vhdl/core/corefifo_grayToBinConv.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vhdl/core/corefifo_async.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vhdl/core/COREFIFO_C0_COREFIFO_C0_0_LSRAM_top.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vhdl/core/COREFIFO_C0_COREFIFO_C0_0_ram_wrapper.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vhdl/core/COREFIFO.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_Spectrometer/COREFIFO_Spectrometer_0/rtl/vhdl/core/corefifo_fwft.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_Spectrometer/COREFIFO_Spectrometer_0/rtl/vhdl/core/corefifo_sync_scntr.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_Spectrometer/COREFIFO_Spectrometer_0/rtl/vhdl/core/corefifo_sync.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_Spectrometer/COREFIFO_Spectrometer_0/rtl/vhdl/core/corefifo_NstagesSync.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_Spectrometer/COREFIFO_Spectrometer_0/rtl/vhdl/core/corefifo_grayToBinConv.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_Spectrometer/COREFIFO_Spectrometer_0/rtl/vhdl/core/corefifo_async.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_Spectrometer/COREFIFO_Spectrometer_0/rtl/vhdl/core/COREFIFO_Spectrometer_COREFIFO_Spectrometer_0_LSRAM_top.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_Spectrometer/COREFIFO_Spectrometer_0/rtl/vhdl/core/COREFIFO_Spectrometer_COREFIFO_Spectrometer_0_ram_wrapper.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_Spectrometer/COREFIFO_Spectrometer_0/rtl/vhdl/core/COREFIFO.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/COREFIFO_Spectrometer/COREFIFO_Spectrometer.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/spectrometer_fixpt_pkg.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/ADC_UART_RDOUT.vhd"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_IOD_ADC_ADS4245/PF_IOD_RX/PF_IOD_ADC_ADS4245_PF_IOD_RX_PF_IOD.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_IOD_ADC_ADS4245/PF_IOD_ADC_ADS4245.v"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/ADS4245_CNTL.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/IO_registers.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/LED_DIMMER_s.vhd"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_CCC_C0/PF_CCC_C0_0/PF_CCC_C0_PF_CCC_C0_0_PF_CCC.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_CCC_C0/PF_CCC_C0.v"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/CORERESET_PF_C0/CORERESET_PF_C0_0/core/corereset_pf.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/CORERESET_PF_C0/CORERESET_PF_C0.vhd"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_INIT_MONITOR_C0/PF_INIT_MONITOR_C0_0/PF_INIT_MONITOR_C0_PF_INIT_MONITOR_C0_0_PF_INIT_MONITOR.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_INIT_MONITOR_C0/PF_INIT_MONITOR_C0.v"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/PF_RESET.vhd.vhd"
vcom -2008 -explicit  -work COREUART_LIB "${PROJECT_DIR}/component/work/COREUART_C0/COREUART_C0_0/rtl/vhdl/core/Rx_async.vhd"
vcom -2008 -explicit  -work COREUART_LIB "${PROJECT_DIR}/component/work/COREUART_C0/COREUART_C0_0/rtl/vhdl/core/Tx_async.vhd"
vcom -2008 -explicit  -work COREUART_LIB "${PROJECT_DIR}/component/work/COREUART_C0/COREUART_C0_0/rtl/vhdl/core/fifo_256x8_g5.vhd"
vcom -2008 -explicit  -work COREUART_LIB "${PROJECT_DIR}/component/work/COREUART_C0/COREUART_C0_0/rtl/vhdl/core/Clock_gen.vhd"
vcom -2008 -explicit  -work COREUART_LIB "${PROJECT_DIR}/component/work/COREUART_C0/COREUART_C0_0/rtl/vhdl/core/coreuart_pkg.vhd"
vcom -2008 -explicit  -work COREUART_LIB "${PROJECT_DIR}/component/work/COREUART_C0/COREUART_C0_0/rtl/vhdl/core/CoreUART.vhd"
vcom -2008 -explicit  -work COREUART_LIB "${PROJECT_DIR}/component/work/COREUART_C0/COREUART_C0_0/rtl/vhdl/core/components.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/COREUART_C0/COREUART_C0.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/UART_FIFO/UART_FIFO_0/rtl/vhdl/core/corefifo_fwft.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/UART_FIFO/UART_FIFO_0/rtl/vhdl/core/corefifo_sync_scntr.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/UART_FIFO/UART_FIFO_0/rtl/vhdl/core/corefifo_sync.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/UART_FIFO/UART_FIFO_0/rtl/vhdl/core/corefifo_NstagesSync.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/UART_FIFO/UART_FIFO_0/rtl/vhdl/core/corefifo_grayToBinConv.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/UART_FIFO/UART_FIFO_0/rtl/vhdl/core/corefifo_async.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/UART_FIFO/UART_FIFO_0/rtl/vhdl/core/UART_FIFO_UART_FIFO_0_LSRAM_top.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/UART_FIFO/UART_FIFO_0/rtl/vhdl/core/UART_FIFO_UART_FIFO_0_ram_wrapper.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/UART_FIFO/UART_FIFO_0/rtl/vhdl/core/COREFIFO.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/UART_FIFO/UART_FIFO.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/LuSEE_Pkg.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/uart_reader.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/UART_IO.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/SimpleDualPortRAM_generic.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/average_instance_P1_fixpt.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/SimpleDualPortRAM_generic_block.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/deinterlace_instance_12_fixpt_pkg.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/deinterlace_instance_12_fixpt.vhd"
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
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/TWDLROM_11_1_array.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/TWDLROM_3_1.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/TWDLROM_5_1.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/TWDLROM_7_1.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/TWDLROM_9_1.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/dsphdl_FFT.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/sfft_fixpt.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/weight_fold_instance_1_fixpt.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/weight_streamer_fixpt.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/sfft_fixpt_pkg.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/weight_streamer_fixpt_pkg.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/correlate_fixpt.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/average_stage1.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/spectrometer_fixpt.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/LuSEE_PF_EVAL.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/SPEC_TST.vhd"

vsim -L PolarFire -L presynth -L COREUART_LIB -L COREFIFO_LIB  -t 1ps -pli $1/lib/modelsimpro/pli/pf_crypto_lin_me_pli.so presynth.SPEC_TST

add wave /SPEC_TST/*
add wave /spec_tst/spectrometer_fixpt_0/sample1
add wave /spec_tst/spectrometer_fixpt_0/sample2
add wave /spec_tst/spectrometer_fixpt_0/Navg
add wave /spec_tst/spectrometer_fixpt_0/pks
add wave /spec_tst/spectrometer_fixpt_0/outbin
add wave /spec_tst/spectrometer_fixpt_0/ready

set strobe Low
set count 0

when {/spec_tst/spectrometer_fixpt_0/ready = 1} {
   if {$strobe eq "Low"} {
      echo "ready is 1"
      set strobe High

      #Can't find a simple way to do regular damn addition in ModelSim's DO files
      set count [expr $count + 1]

      if {$count == 2} {
         echo "fft_ready rose for the second time"

         vcd file spec_test.vcd
         vcd add /spec_tst/*
         vcd add /spec_tst/spectrometer_fixpt_0/sample1
         vcd add /spec_tst/spectrometer_fixpt_0/sample2
         vcd add /spec_tst/spectrometer_fixpt_0/Navg
         vcd add /spec_tst/spectrometer_fixpt_0/pks
         vcd add /spec_tst/spectrometer_fixpt_0/outbin
         vcd add /spec_tst/spectrometer_fixpt_0/ready
      }
   }
}

when {/spec_tst/spectrometer_fixpt_0/ready = 0} {
   if {$strobe eq "High"} {
      echo "ready is 0"
      set strobe Low

      if {$count == 2} {
         echo "fft_ready fell for the second time"
         vcd flush
         stop
      }
   }
}


run -all
vcd flush
exit
