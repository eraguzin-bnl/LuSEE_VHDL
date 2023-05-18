echo "Here we are in Eric's LuSEE Libero DO file"
echo "Do --> argv is $argv"
echo "Do --> Libero system library is $1"
echo "Do --> Project directory is $2"

# argv comes in as the terminal command from Libero (when started by the command line. Starting simulator through GUI gives different initial command)
# -- -l presynth_simulation.log -c -do {do /home/eraguzin/nextcloud/LuSEE/Libero/PF_EVAL/LuSEE_VHDL/simulation/run_LuSEE.do /usr/local/microchip/Libero_SoC_v2022.3/Libero /home/eraguzin/nextcloud/LuSEE/Libero/PF_EVAL/LuSEE_VHDL outlog spec_notch_pf spec_notch_nopf spec_nonotch_pf spec_nonotch_nopf}

# So argv[0] is --, argv[1] is -1, argv[2] is presynth_simulation.log and so on. So first I just grab the 5th index, which is the actual incoming arguments (including another 'do')

quietly set actual_command [lindex $argv 5]
#quietly set actual_command $argv[0]
#echo "$actual_command"
quietly set command_split [split $actual_command " "]
#echo "$command_split"
#foreach i $command_split {
#   echo $i
#   }

# Now we have something like
# do /home/eraguzin/nextcloud/LuSEE/Libero/PF_EVAL/LuSEE_VHDL/simulation/run_LuSEE.do /usr/local/microchip/Libero_SoC_v2022.3/Libero /home/eraguzin/nextcloud/LuSEE/Libero/PF_EVAL/LuSEE_VHDL spec0 spec1
# do is first, then the 3 arguments with directory locations. So the 4th index is the variable number of VHDL blocks argument (spec0 in this case)
# We want to take all the arguments from 4 on and make them an array

quietly set num_arguments [llength $command_split]
#echo "$num_arguments"

for {set i 6} {$i < $num_arguments} {incr i} {
#   echo $i
#   echo "Do --> Will simulate and save VHDL test [lindex $command_split $i]"
   set vhdl_tests([expr $i-6]) [lindex $command_split $i]
   #lappend vhdl_tests [lindex $command_split $i]
}

quietly set num_tests [array size vhdl_tests]
echo "Do --> There are $num_tests VHDL tests"

for {set i 0} {$i < $num_tests} {incr i} {
   echo "Do -->  VHDL Test $i to simulate and save is $vhdl_tests($i)"
}

quietly set ACTELLIBNAME PolarFire
quietly set PROJECT_DIR $2
quietly set LIBERO_DIR $1
#The log file is the 3rd argument
echo "Do --> Log file is $3.log"
quietly set log_file $3

#The test block is the 4th argument
echo "Do --> Test file is $4"
quietly set test_file $4

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth
   vlib presynth
}
vmap presynth presynth
vmap PolarFire "${LIBERO_DIR}/lib/modelsimpro/precompiled/vlog/polarfire"
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
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_TPSRAM_C0/PF_TPSRAM_C0_0/PF_TPSRAM_C0_PF_TPSRAM_C0_0_PF_TPSRAM.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_TPSRAM_C0/PF_TPSRAM_C0.v"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/average_stage1.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/correlate_fixpt.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/SimpleDualPortRAM_generic_block.vhd"
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
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/TWDLROM_11_1_array.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/TWDLROM_3_1.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/TWDLROM_5_1.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/TWDLROM_7_1.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/TWDLROM_9_1.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/dsphdl_FFT.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/sfft_fixpt.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/weight_fold_instance_1_fixpt.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/weight_streamer_fixpt.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/spectrometer_fixpt.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/LuSEE_PF_EVAL.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/deinterlace_instance_12_fixpt_pkg.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/sfft_fixpt_pkg.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/weight_streamer_fixpt_pkg.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/SPEC_TST.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/spectrometer_half.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/HW_NOTCH_TST.vhd"

vsim -L PolarFire -L presynth -L COREUART_LIB -L COREFIFO_LIB -l "${log_file}.log" -t 1ps -pli ${LIBERO_DIR}/lib/modelsimpro/pli/pf_crypto_lin_me_pli.so presynth."$test_file"

#https://www.microsemi.com/document-portal/doc_view/136364-modelsim-me-10-4c-command-reference-manual-for-libero-soc-v11-7
#I loop through each of the desired VHDL implementations and use the 'when' command to tag certain signals to give feedback for when they change
#Specifically I want to know how many batches of data are getting sent into averager, when the notch is subtracting, and when the averager is finished
#The first set of data is junk, so I wait until the second output from averager
#Because of how the 'when' statement works, the condition has to be given with the double quotes so that it can include a variable
#The expression is also difficult. If you give it the way it says in the manual with curly brackets, you can't have it evaluate the index (i) during the first pass, so that there's a difference between each VHDL block

#For example, I need to have all my variables I use to track things be arrays. So VHDL block 0 gets strobe(0), VHDL block 1 gets strobe(1), etc...
#I am looping through the for loop with 'i' as my varaible to set things up
#But when you want to do something based on that in the `when` command expression, like `set sfft_log($i) High`, the $i cannot be evaluated when it's in that when expression, Modelsim's syntax doesn't allow for it.
#After setting up the loop, i is its last assigned number forever. When the when statements get called, it doesn't have a local variable, everything in here is a global variable
#So I needed set a, b, c, etc... separately, make sure that the variables I want evaluated during the loop are evaluated. Then use that entire command as a string (a, b, c) as the expression that the `when` statement runs

#I gave each when breakpoint labels so that they could be deactivated once they were done and not clog up the output or accidentally print to file again. So when they're finished, they get deactivated

for {set i 0} {$i < $num_tests} {incr i} {
   echo "Do -->  Setting up $vhdl_tests($i)"

   quietly set strobe($i) Low
   quietly set sfft_log($i) Low
   quietly set notch_log($i) Low
   quietly set averager_count($i) 0
   quietly set sfft_count($i) 0
   quietly set notch_count($i) 0
   quietly set stop_request($i) 0
   quietly set time_print 0
   quietly set notch_error($i) Low
   quietly set main_error($i) Low

   set a "if {\$sfft_log($i) eq \"Low\"} {
         set sfft_log($i) High
         set sfft_count($i) \[expr \$sfft_count($i) + 1\]
         echo \"\[expr \$now/1000000\] us --> Another batch of data coming in from $vhdl_tests($i)'s sfft and correlate, #\$sfft_count($i)\"
      }
   "
   when -label "a_$i" "/$test_file/$vhdl_tests($i)/average_signed_A1/ready_in = 1" $a

   set b "if {\$sfft_log($i) eq \"High\"} {
         set sfft_log($i) Low
      }
   "
   when -label "b_$i" "/$test_file/$vhdl_tests($i)/average_signed_A1/ready_in = 0" $b

   set c "if {\$notch_log($i) eq \"Low\"} {
         set notch_log($i) High
         set notch_count($i) \[expr \$notch_count($i) + 1\]
         echo \"\[expr \$now/1000000\] us --> Notch is subtracting from $vhdl_tests($i)'s current running average in averager, #\$notch_count($i)\"
      }
   "
   when -label "c_$i" "/$test_file/$vhdl_tests($i)/average_signed_A1/subtract_ready = 1" $c

   set d  "if {\$notch_log($i) eq \"High\"} {
         set notch_log($i) Low
      }
   "
   when -label "d_$i" "/$test_file/$vhdl_tests($i)/average_signed_A1/subtract_ready = 0" $d

   set e "if {\$strobe($i) eq \"Low\"} {
         echo \"\[expr \$now/1000000\] us --> $vhdl_tests($i)'s averager out ready is 1\"
         set strobe($i) High

         #Can't find a simple way to do regular damn addition in ModelSim's DO files
         set averager_count($i) \[expr \$averager_count($i) + 1\]

         if {\$averager_count($i) == 2} {
            echo \"\[expr \$now/1000000\] us --> $vhdl_tests($i)'s averager out ready rose for the second time, recording in VCD file\"

            vcd files ${log_file}_$vhdl_tests($i).vcd
            vcd add -file ${log_file}_$vhdl_tests($i).vcd /$test_file/$vhdl_tests($i)/sample1
            vcd add -file ${log_file}_$vhdl_tests($i).vcd /$test_file/$vhdl_tests($i)/sample2
            vcd add -file ${log_file}_$vhdl_tests($i).vcd /$test_file/$vhdl_tests($i)/Navg_notch
            vcd add -file ${log_file}_$vhdl_tests($i).vcd /$test_file/$vhdl_tests($i)/Navg_main
            vcd add -file ${log_file}_$vhdl_tests($i).vcd /$test_file/$vhdl_tests($i)/Streamer_DLY
            vcd add -file ${log_file}_$vhdl_tests($i).vcd /$test_file/$vhdl_tests($i)/weight_fold_DLY
            vcd add -file ${log_file}_$vhdl_tests($i).vcd /$test_file/$vhdl_tests($i)/sfft_DLY
            vcd add -file ${log_file}_$vhdl_tests($i).vcd /$test_file/$vhdl_tests($i)/notch_en
            vcd add -file ${log_file}_$vhdl_tests($i).vcd /$test_file/$vhdl_tests($i)/correlate_fixpt_notch/index_array
            vcd add -file ${log_file}_$vhdl_tests($i).vcd /$test_file/$vhdl_tests($i)/correlate_fixpt_main/index_array
            vcd add -file ${log_file}_$vhdl_tests($i).vcd /$test_file/$vhdl_tests($i)/pks0
            vcd add -file ${log_file}_$vhdl_tests($i).vcd /$test_file/$vhdl_tests($i)/outbin
            vcd add -file ${log_file}_$vhdl_tests($i).vcd /$test_file/$vhdl_tests($i)/ready
            vcd add -file ${log_file}_$vhdl_tests($i).vcd /$test_file/$vhdl_tests($i)/error_notch
            vcd add -file ${log_file}_$vhdl_tests($i).vcd /$test_file/$vhdl_tests($i)/error_main
         }
      }
   "
   when -label "e_$i" "/$test_file/$vhdl_tests($i)/ready = 1" $e
   #echo "$e"
   set f "if {\$strobe($i) eq \"High\"} {
         echo \"\[expr \$now/1000000\] us --> $vhdl_tests($i)'s averager out ready is 0\"
         set strobe($i) Low

         if {\$averager_count($i) == 2} {
            echo \"\[expr \$now/1000000\] us --> $vhdl_tests($i)'s averager out ready fell for the second time, requesting to finish simulation\"
            vcd off ${log_file}_$vhdl_tests($i).vcd
            vcd flush ${log_file}_$vhdl_tests($i).vcd
            set stop_request($i) 1
            nowhen \"a_$i\"
            nowhen \"b_$i\"
            nowhen \"c_$i\"
            nowhen \"d_$i\"
            nowhen \"e_$i\"
            nowhen \"f_$i\"

            echo \"\[expr \$now/1000000\] us --> Checking to see if other blocks are ready to stop\"
            set off High
            for {set j 0} {\$j < $num_tests} {incr j} {
               if {\$stop_request(\$j) == 0} {
                  echo \"\[expr \$now/1000000\] us --> Block \$j is still running\"
                  set off Low
               }
            }
            echo \"\[expr \$now/1000000\] us --> Off is \$off\"
            if {\$off eq \"High\"} {
               echo \"\[expr \$now/1000000\] us --> All blocks are finished, ending simulation\"
               stop
            }
         }
      }
   "
   #echo "$f"
   when -label "f_$i" "/$test_file/$vhdl_tests($i)/ready = 0" $f

   set g "if {\$notch_error($i) eq \"Low\"} {
         set notch_error($i) High
         echo \"\[expr \$now/1000000\] us --> Notch error from $vhdl_tests($i)'s notch correlator has triggered! Ending simulation!\"
         stop
      }
   "
   when -label "g_$i" "/$test_file/$vhdl_tests($i)/correlate_fixpt_notch/error_out(0) = 1" $g

   set h "
         if {\$notch_error($i) eq \"High\"} {
         set notch_error($i) Low
      }
   "
   when -label "h_$i" "/$test_file/$vhdl_tests($i)/correlate_fixpt_notch/error_out(0) = 0" $h

   set j "if {\$main_error($i) eq \"Low\"} {
         set main_error($i) High
         echo \"\[expr \$now/1000000\] us --> Main error from $vhdl_tests($i)'s signal correlator has triggered! Ending simulation!\"
         stop
      }
   "
   #echo "$j"
   when -label "j_$i" "/$test_file/$vhdl_tests($i)/correlate_fixpt_main/error_out(0) = 1" $j

   set k "if {\$main_error($i) eq \"High\"} {
         set main_error($i) Low
      }
   "
   when -label "k_$i" "/$test_file/$vhdl_tests($i)/correlate_fixpt_main/error_out(0) = 0" $k
}
quietly set i 0
run -all
#vcd flush
exit
