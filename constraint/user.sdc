create_clock -name {SPEC_CLK} -period 10 -waveform {0 5 } -add  [ get_nets { ADC_S_CLK } ]
set_clock_groups -name {clock_grp} -logically_exclusive -group [ get_clocks { clk_50MHz } ] -group [ get_clocks { SPEC_CLK } ] -group [ get_clocks { PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0 } ]
