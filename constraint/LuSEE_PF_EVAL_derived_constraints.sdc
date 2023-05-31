# Microsemi Corp.
# Date: 2023-May-31 12:44:19
# This file was generated based on the following SDC source files:
#   /home/eraguzin/nextcloud/LuSEE/Libero/PF_EVAL/LuSEE_VHDL/component/work/PF_CCC_C0/PF_CCC_C0_0/PF_CCC_C0_PF_CCC_C0_0_PF_CCC.sdc
#   /home/eraguzin/nextcloud/LuSEE/Libero/PF_EVAL/LuSEE_VHDL/component/work/PF_IOD_ADC_ADS4245/PF_IOD_ADC_ADS4245.sdc
#   /home/eraguzin/nextcloud/LuSEE/Libero/PF_EVAL/LuSEE_VHDL/component/work/COREFIFO_Spectrometer/COREFIFO_Spectrometer_0/COREFIFO_Spectrometer_COREFIFO_Spectrometer_0_COREFIFO.sdc
#   /home/eraguzin/nextcloud/LuSEE/Libero/PF_EVAL/LuSEE_VHDL/component/work/COREFIFO_C0/COREFIFO_C0_0/COREFIFO_C0_COREFIFO_C0_0_COREFIFO.sdc
#   /home/eraguzin/nextcloud/LuSEE/Libero/PF_EVAL/LuSEE_VHDL/component/work/UART_FIFO/UART_FIFO_0/UART_FIFO_UART_FIFO_0_COREFIFO.sdc
# *** Any modifications to this file will be lost if derived constraints is re-run. ***
#

create_clock -name {clk_50MHz} -period 20 [ get_ports { clk_50MHz } ]
create_clock -name {ADC_CLKOUT_P} -period 10 [ get_ports { ADC_CLKOUT_P } ]
create_generated_clock -name {PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0} -multiply_by 2 -source [ get_pins { PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0 } ]
set_false_path -to [ get_cells { ADC_UART_RDOUT_inst/COREFIFO_Spectrometer_A_inst/COREFIFO_Spectrometer_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { ADC_UART_RDOUT_inst/COREFIFO_Spectrometer_B_inst/COREFIFO_Spectrometer_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { ADC_UART_RDOUT_inst/COREFIFO_Spectrometer_C_inst/COREFIFO_Spectrometer_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { ADC_UART_RDOUT_inst/COREFIFO_Spectrometer_D_inst/COREFIFO_Spectrometer_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { ADC_UART_RDOUT_inst/COREFIFO_Spectrometer_BIN_inst/COREFIFO_Spectrometer_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { ADC_UART_RDOUT_inst/COREFIFO_C0_A_inst/COREFIFO_C0_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { ADC_UART_RDOUT_inst/COREFIFO_C0_B_inst/COREFIFO_C0_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { UART_IO_0/uart_reader_i/UART_FIFO_inst/UART_FIFO_0/genblk*.U_corefifo_async/*/shift_reg* } ]
