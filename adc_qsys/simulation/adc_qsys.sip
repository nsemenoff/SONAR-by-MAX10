set_global_assignment -entity "adc_qsys" -library "lib_adc_qsys" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "adc_qsys" -library "lib_adc_qsys" -name IP_TOOL_VERSION "18.0"
set_global_assignment -entity "adc_qsys" -library "lib_adc_qsys" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_adc_qsys" -name SPD_FILE [file join $::quartus(sip_path) "../adc_qsys.spd"]
set_global_assignment -library "lib_adc_qsys" -name MISC_FILE [file join $::quartus(sip_path) "../../adc_qsys.qsys"]

set_global_assignment -library "lib_adc_qsys" -name MISC_FILE [file join $::quartus(sip_path) "adc_qsys.vhd"]
set_global_assignment -library "lib_adc_qsys" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_controller.v"]
set_global_assignment -library "lib_adc_qsys" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_synchronizer.v"]
set_global_assignment -library "lib_adc_qsys" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_controller.sdc"]
set_global_assignment -library "lib_adc_qsys" -name MISC_FILE [file join $::quartus(sip_path) "submodules/adc_qsys_PLL0.vho"]
set_global_assignment -library "lib_adc_qsys" -name MISC_FILE [file join $::quartus(sip_path) "submodules/adc_qsys_ADC_0.vhd"]
set_global_assignment -library "lib_adc_qsys" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_modular_adc_control.v"]
set_global_assignment -library "lib_adc_qsys" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_modular_adc_control_avrg_fifo.v"]
set_global_assignment -library "lib_adc_qsys" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_modular_adc_control_fsm.v"]
set_global_assignment -library "lib_adc_qsys" -name MISC_FILE [file join $::quartus(sip_path) "submodules/chsel_code_converter_sw_to_hw.v"]
set_global_assignment -library "lib_adc_qsys" -name MISC_FILE [file join $::quartus(sip_path) "submodules/fiftyfivenm_adcblock_primitive_wrapper.v"]
set_global_assignment -library "lib_adc_qsys" -name MISC_FILE [file join $::quartus(sip_path) "submodules/fiftyfivenm_adcblock_top_wrapper.v"]
