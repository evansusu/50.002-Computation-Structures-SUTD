set projDir "C:/Users/65842/Documents/mojo/modular/work/planAhead"
set projName "TestCases"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/65842/Documents/mojo/modular/work/verilog/mojo_top_0.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/xalu_1.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/reset_conditioner_2.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/edge_detector_3.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/multi_seven_seg_4.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/multi_seven_seg_4.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/multi_dec_ctr_6.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/counter_7.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/button_conditioner_8.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/laneconvert_9.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/scoretoseg_10.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/scoretoseg_10.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/trianglefsm_12.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/cyclefsm_13.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/xshifter_14.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/xadder_15.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/xboole_16.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/xcompare_17.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/counter_18.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/seven_seg_19.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/decoder_20.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/counter_18.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/seven_seg_19.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/decoder_20.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/dec_ctr_24.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/pipeline_25.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/convertsingleled_26.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/convertsingleled_26.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/convertsingleled_26.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/convertsingleled_26.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/convertsingleled_26.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/convertsingleled_26.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/convertsingleled_26.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/convertsingleled_26.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/pn_gen_34.v" "C:/Users/65842/Documents/mojo/modular/work/verilog/stateCounter_35.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/65842/Documents/mojo/modular/constraint/own.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
