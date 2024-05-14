#!/usr/bin/env tclsh

# Read the "top" variable from command line
set project [lindex $argv 0]

package require ::quartus::flow
package require ::quartus::project
package require ::quartus::report

project_open $project

proc touch filename {
    close [open $filename a]
}

if {[catch {execute_flow -compile} result]} {
	puts "\nResult: $result\n"
	puts "ERROR: Compilation failed. See report files.\n"
} else {
	puts "\nINFO: Compilation was successful.\n"
    touch $project.sof.done
}