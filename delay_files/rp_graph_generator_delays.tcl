#*******************************************************
 # Copyright (C) 2016
 #
 # This file is part of Comparison of Routing Protocols using Tcp variants project
 # written by Amarjit Singh<amarjitdhillon@sce.carleton.ca>, Ranjit Singh Saini<ranjitsaini@cmail.carleton.ca>
 #
 # It can not be copied and/or distributed without the express
 # permission of respective authors
 #*******************************************************/
set list_of_protocol {AODV DSR DSDV}

foreach name_of_protocol $list_of_protocol {

	if { $name_of_protocol == "AODV" } {
		set yrange 0.08
		} elseif { $name_of_protocol == "DSR" } {
			set yrange 0.03

	} elseif {$name_of_protocol == "DSDV"} {
		set yrange 0.06

	}
	set directory rp
set current_file [open $directory/$name_of_protocol\_delay.p w+]
puts $current_file "set title \"Comparative analysis of end-to-end delay in $name_of_protocol Routing Protocol and TCP variants combinations\"
set xlabel \"Time(Seconds)\"
set ylabel \"end-to-end delay(s)\"
set xrange \[0:50\]
set yrange \[0:$yrange\]
set grid
set title font \"Times-Roman, 20\"
set xtics font \"Times-Roman, 15\"
set ytics font \"Times-Roman, 15\"
set xlabel font \"Times-Roman, 15\"
set ylabel font \"Times-Roman, 15\"
set key font \"Times-Roman, 15\"

set style line 1 lt 2 lw 2 pt 3 ps 0.5
"
close $current_file

set current_file_to_append [open $directory/$name_of_protocol\_delay.p a+]
# puts	list_of_files_AODV
 set i 0
 foreach file [glob $name_of_protocol\_*.tr] {
 	global $i $current_file_to_append
 	set title $file

 set title [ string  map {\_ " " } $title ]
 set title [ string  map {\.tr "" } $title ]

 	if {$i == 0} {
 	global $current_file

 	 puts $current_file_to_append "plot \"$file\" every 70 with lines title \"$title\""

 	} else  {
 	   puts $current_file_to_append "replot \"$file\" every 70 with lines title \"$title\""
 	}
 	incr i

}

puts $current_file_to_append "set term pngcairo size 1920,1080 "
puts $current_file_to_append "set output \"$directory\/graphs\/$name_of_protocol\_delay.png\""
puts $current_file_to_append "replot"
close $current_file_to_append
puts "The Gnuplot file for $name_of_protocol is generated.\n Goto $directory folder and Type Load \"$name_of_protocol\_delay.p\" in gnuplot to run \n-------------------"
exec gnuplot "$directory/$name_of_protocol\_delay.p"
puts "--------------Waiting for 3 seconds--------------- "
after 3000
 }
puts "-----------------------------\n all Done Successfuly. The graphs are in $directory folder "
