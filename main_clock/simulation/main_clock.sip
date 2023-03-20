set_global_assignment -entity "main_clock" -library "lib_main_clock" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "main_clock" -library "lib_main_clock" -name IP_TOOL_VERSION "18.0"
set_global_assignment -entity "main_clock" -library "lib_main_clock" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_main_clock" -name SPD_FILE [file join $::quartus(sip_path) "../main_clock.spd"]
set_global_assignment -library "lib_main_clock" -name MISC_FILE [file join $::quartus(sip_path) "../../main_clock.qsys"]

set_global_assignment -library "lib_main_clock" -name MISC_FILE [file join $::quartus(sip_path) "main_clock.vhd"]
set_global_assignment -library "lib_main_clock" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_int_osc.v"]
set_global_assignment -library "lib_main_clock" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_int_osc.sdc"]
