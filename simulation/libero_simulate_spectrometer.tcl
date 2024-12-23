# Microsemi Tcl Script
# libero
# Date: Wed Nov 23 15:33:55 2022
# Will start up libero with the exported Matlab files

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------
#Get all directory values
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------

puts "TCL --> Welcome to Eric's LuSEE Libero Setup TCL script!"



set libero_location [lindex $argv 0]
set libero_root1 [file dirname $libero_location]
set libero_root [file dirname $libero_root1]
set project_location [lindex $argv 1]
set project_file [lindex $argv 2]
set log_file [lindex $argv 3]
set test_file_in [lindex $argv 4]
set project_file_path "$project_location/$project_file"
set project_name [file rootname $project_file]
set test_file "$project_location/stimulus/$test_file_in.vhd"

puts "TCL --> Libero location is $libero_location"
puts "TCL --> Libero root is $libero_root"
puts "TCL --> Project location is $project_location"
puts "TCL --> Project name is $project_name"
puts "TCL --> Log file is $log_file"
puts "TCL --> Test file is $test_file"

for {set i 0} {$i < $argc} {incr i} {
    #puts "arg is [lindex $argv $i]"
    if {$i > 4} {
        puts "TCL --> Will simulate and save VHDL test [lindex $argv $i]"
        #set vhdl_tests([expr $i-4]) [lindex $argv $i]
        lappend vhdl_tests [lindex $argv $i]
    }
}
#puts "TCL --> $vhdl_tests"
#for {set i 0} {$i < [expr $argc - 4]} {incr i} {
#    puts "TCL --> VHDL Test $i to simulate and save is $vhdl_tests($i)"
#}

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------
#Libero operations, create the project
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------
puts "TCL --> Opening $project_file_path"
open_project -file $project_file_path

puts "TCL --> Organizing project"
#pkg files must come first or else ModelSim doesn't know where to get the library specified in the test bench file
organize_tool_files -tool {SIM_PRESYNTH} -file $test_file -module {LuSEE_PF_EVAL::work} -input_type {stimulus}
organize_tool_files -tool {SIM_POSTSYNTH} -file $test_file -module {LuSEE_PF_EVAL::work} -input_type {stimulus}
organize_tool_files -tool {SIM_POSTLAYOUT} -file $test_file -module {LuSEE_PF_EVAL::work} -input_type {stimulus}

#Necessary because Libero is in project mode. Equivalent to pressing "Build Heirarchy" button in GUI and selecting top level
build_design_hierarchy

puts "TCL --> Preparing test"
#Equivalent of going to Project Options and changing DO file area. Testbench will have a different name then default, so it needs to know
#Tells Libero that by default, next time you start a ModelSim simulation, don't auto-generate a DO file, use this custom one
set_modelsim_options -tb_module_name "$test_file_in"
set_modelsim_options -use_automatic_do_file 0
set_modelsim_options -user_do_file "$project_location/simulation/run_LuSEE.do"
set_modelsim_options -do_file_args "$libero_root $project_location $log_file $test_file_in $vhdl_tests"
save_project

puts "TCL --> Running simulation..."
puts "TCL --> May take some time. Run 'tail -F $project_location/simulation/$log_file.log' in a new terminal for real time updates"
#Run specific tools
#https://onlinedocs.microchip.com/pr/GUID-FABC58FF-E2CC-4557-BA80-9C03AAFAA2D2-en-US-6/index.html?GUID-177689DE-CA56-4BB8-A64A-47C05C26F071
run_tool -name {SIM_PRESYNTH}
#run_tool -name {SYNTHESIZE}
#save_project
puts "TCL --> Simulation finished, closing Libero"

#save_project
close_project -save 1
puts "TCL --> Project closed"
