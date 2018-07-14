#*******************************************************
 # Copyright (C) 2016
 #
 # This file is part of Comparison of Routing Protocols using Tcp variants project
 # written by Amarjit Singh<amarjitdhillon@sce.carleton.ca>, Ranjit Singh Saini<ranjitsaini@cmail.carleton.ca>
 #
 # It can not be copied and/or distributed without the express
 # permission of respective authors
 #*******************************************************/
set list_of_protocol {Reno Newreno Sack1 Vegas Fack Linux}
set directory tcp
foreach name_of_protocol $list_of_protocol {

	if { $name_of_protocol == "Reno" } {
		set yrange 100
		} else {
		set yrange 100 }

set current_file [open $directory/$name_of_protocol\_pdr.p w+]
puts $current_file "#!/usr/bin/gnuplot
set title \"Comparative analysis of PDR% in $name_of_protocol TCP combinations\"
set xlabel \"Time(Seconds)\"
set ylabel \"pdr(s)\"
set xrange \[0:50\]
set yrange \[0:$yrange\]
set grid
set title font \"Times-Roman, 20\"
set xtics font \"Times-Roman, 18\"
set ytics font \"Times-Roman, 18\"
set xlabel font \"Times-Roman, 21\"
set ylabel font \"Times-Roman, 21\"
set key font \"Times-Roman, 18\"

set style line 1 lt 2 lw 2 pt 3 ps 0.5
"
close $current_file

set current_file_to_append [open $directory/$name_of_protocol\_pdr.p a+]
# puts	list_of_files_AODV
 set i 0
 foreach file [glob *\_$name_of_protocol.tr] {
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
puts $current_file_to_append "set output \"$directory\/graphs\/$name_of_protocol\_pdr.png\""
puts $current_file_to_append "replot"
close $current_file_to_append
puts "The Gnuplot file for $name_of_protocol is generated.\n Type load \"$name_of_protocol\_pdr.p\" in gnuplot to run \n-------------------"
exec gnuplot "$directory/$name_of_protocol\_pdr.p"
puts "--------------Waiting for 2 seconds--------------- "
after 2000
 }
puts "-----------------------------\n all Done Successfuly 😊 "
