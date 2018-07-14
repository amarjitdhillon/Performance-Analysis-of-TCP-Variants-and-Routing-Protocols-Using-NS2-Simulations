#*******************************************************
 # Copyright (C) 2016
 #
 # This file is part of Comparison of Routing Protocols using Tcp variants
 # written by Amarjit Singh<amarjitdhillon@sce.carleton.ca>, Ranjit Singh Saini<ranjitsaini@cmail.carleton.ca>
 #
 # It can not be copied and/or distributed without the express
 # permission of respective authors
 #*******************************************************/
 #


# Setting the variables intially
set val(anteena_type_used)                 Antenna/OmniAntenna        ;
set val(ifqlen)                            50                         ;
set val(ll)                                LL                         ;
set val(mobile_nodes_count)                50                         ;
set val(propagation_model)                 Propagation/TwoRayGround   ;
set val(queuing_model)                     Queue/DropTail/PriQueue    ;
set val(length_of_topography)              600   		                  ;
set val(simulation_stop_time)     	        50		                    ;
set val(type_of_channel)                   Channel/WirelessChannel    ;
set val(type_of_interface)                 Phy/WirelessPhy            ;
set val(type_of_mac)                       Mac/802_11                 ;
set val(type_of_routing_protocol)          AODV                       ;
set val(width_of_topography)               600   		                  ;

#variable ends


puts "\n Please enter the Protocol no. Which you want to Use.\n 1.AODV \n 2.DSR \n 3.DSDV \n Enter Your Value::"
flush stdout
set protocol_name [gets stdin]

if {$protocol_name == 1} {
   set val(type_of_routing_protocol) AODV;
   puts "\nYou have selected AODV routing protocol \n"

} elseif {$protocol_name == 2} {
  set val(type_of_routing_protocol) DSR;
     puts "You have selected DSR routing protocol \n"

  } elseif {$protocol_name == 3} {
    set val(type_of_routing_protocol) DSDV;
    puts "You have selected DSDV routing protocol \n"

    }  else {
puts "\n Please renter the correct protocol name. You should enter the numerical value provided in the above description."
   exit 1
}

#we ask the user to enter the tcp variant
puts "------------------------------------------------------------------------"
puts "\n Please enter the TCP variant Which you want to Use. \n
1.TCP/Reno
2.TCP/Newreno
3.TCP/Sack1
4.TCP/Vegas
5.TCP/Fack
6.TCP/Linux"
puts "enter Your value for tcp variant::"
flush stdout
set tcp_name_variant [gets stdin]

switch $tcp_name_variant {
 1 {
   set val(tcp_variant_input) Reno;
   }
 2 {
  set val(tcp_variant_input) Newreno;
	}
  3 {
  set val(tcp_variant_input) Sack1;
	}
  4 {
  set val(tcp_variant_input) Vegas;

 	 }
  5 {
  set val(tcp_variant_input) Fack;
	}

 6 {
  set val(tcp_variant_input) Linux;
  }
 default {

puts "Please provide the correct tcp variant name. You should enter the numerical value provided in the above description."
   exit 1
}
puts $val(tcp_variant_input)
puts #############################################################################
}

# Object created for simulation

set ns [new Simulator]

# We open the trace file here
set filenamez $val(type_of_routing_protocol)_$val(tcp_variant_input)
set trace_file_path trace_files/$val(type_of_routing_protocol)_$val(tcp_variant_input).tr
set nam_file_path nam_files/$val(type_of_routing_protocol)_$val(tcp_variant_input).nam

set trace_file [open $trace_file_path  w+]
# now we open the namtrace_file file to write

set namtrace_file [open $nam_file_path w]

# we instruct the simulator object ns to save all simulation data into the trace
$ns trace-all $trace_file

#This command sets up wireless nam tracing. <X> and <Y> are the x-y co-ordinates for the wireless topology and all wireless nam traces are written into the <namtracefile>.
$ns namtrace-all-wireless $namtrace_file $val(length_of_topography) $val(width_of_topography)

# creates a topography object

set topo [new Topography]
#This initializes the grid for the topography object. <X> and <Y> are the x-y co-ordinates for the topology and are used for sizing the grid. Optional:res The grid resolution may be passed as <res>. A default value of 1 is normally used.
$topo load_flatgrid $val(length_of_topography) $val(width_of_topography)
# used to create a God instance. The number of mobilenodes is passed as argument which is used by God to create a matrix to store connectivity information of the topology.
set god_ [create-god $val(mobile_nodes_count)]

set channel_to_use [new $val(type_of_channel)]

#Configuration of nodes using the intitially defined variables
        $ns node-config -adhocRouting $val(type_of_routing_protocol) \
			 -llType $val(ll) \
			 -macType $val(type_of_mac) \
			 -ifqType $val(queuing_model) \
			 -ifqLen $val(ifqlen) \
			 -antType $val(anteena_type_used) \
			 -propType $val(propagation_model) \
			 -phyType $val(type_of_interface) \
       -topoInstance $topo \
       -channel $channel_to_use \
       -agentTrace ON \
			 -routerTrace ON \
			 -macTrace OFF \
			 -movementTrace ON

puts "The default settings are::
********************************************
Routing Protocol is: $val(type_of_routing_protocol) with TCP Variant:$val(tcp_variant_input)\n
------------------------------------------\n
llType: $val(ll)                             \n
macType: $val(type_of_mac)                   \n
ifqType: $val(queuing_model)                 \n
ifqLen: $val(ifqlen)                         \n
antType: $val(anteena_type_used)             \n
propType: $val(propagation_model)            \n
phyType: $val(type_of_interface)             \n
agentTrace: ON                               \n
routerTrace: ON 							  	\n
macTrace: OFF 							  	\n
movementTrace: ON                           \n
***********************************************
"
#  loop for nodes creation

for {set i 0} {$i < $val(mobile_nodes_count)} { incr i } {

	set node_($i) [$ns node] ; # set node1 [$ns node]<= this is the object and node1 is the node name
}

# providing the color to nodes

  for {set i 0} {$i < $val(mobile_nodes_count) } {incr i } {
	# intial color for all node is defined as black
	$node_($i) color black

	$ns at 0.0 "$node_($i) color #BA4A00"

}

# here topology contains the value of node position for each node in format of x_pos(node_num) and y_pos(node_num)
source ./topology.tcl

for {set i 0} {$i < $val(mobile_nodes_count) } { incr i } {
# this $x_pos($i) is stored in topology tcl file
$node_($i) set X_ $x_pos($i)
$node_($i) set Y_ $y_pos($i)

}

proc deploy {} {

	global ns node_ val

	for {set i 0} {$i < $val(mobile_nodes_count) } { incr i } {

		$ns at 0.01 "$node_($i) $x_pos($i) $y_pos($i) 500"

	}

}

source ./mobility.tcl

set source 5

set destination 37

puts "------------------------------------------------------------------------"

puts "\n The default source node is $source"

puts "\n The default destination node is $destination \n"
puts "------------------------------------------------------------------------"

$ns at 1.0 "$node_($source) color #FF1493"

$ns at 1.0 "$node_($destination) color #FF1493"

$ns at 1.0 "$node_($source) label Source"

$ns at 1.0 "$node_($destination) label Destination"

$ns at 1.0 "$ns trace-annotate \" Source node is $source\""

$ns at 1.0 "$ns trace-annotate \" Destination node is $destination\""


#*******Data Transmission from Source to Destination*****

set tcp [new Agent/TCP/$val(tcp_variant_input)]

$ns attach-agent $node_($source) $tcp; # attaching source node as TCP reno/sack etc

set ftp [new Application/FTP]

$ftp set interval_ 1.0

$ftp attach-agent $tcp ; # attaching FTP and TCP

set sink [new Agent/TCPSink]

$ns attach-agent $node_($destination) $sink ; # attaching source node as TCPsink

$ns connect $tcp $sink

$ns at 1.0 "$ftp start"

$ns at 1.1 "$ns trace-annotate \" simulator is starting data transmission from source node to destination node\" "

# Define the node size for nam
for {set i 0} {$i < $val(mobile_nodes_count)} { incr i } {
	$ns initial_node_pos $node_($i) 40
}

# Telling nodes when the simulation ends
for {set i 0} {$i < $val(mobile_nodes_count) } { incr i } {
    $ns at $val(simulation_stop_time) "$node_($i) reset";
}

# Ending nam and the simulation
$ns at $val(simulation_stop_time) "$ns nam-end-wireless $val(simulation_stop_time)" ; # $ns nam-end-wireless stop_time
$ns at $val(simulation_stop_time) "simulation_stop_time"
$ns at 50.01 "puts \"end simulation\" ; $ns halt"

# simulation_stop_time Procedure...
proc simulation_stop_time {} {
	global ns trace_file namtrace_file val trace_file_path
	# we set the filenamez here as eg AODV_Reno.nam ..
	set filenamez nam_files/$val(type_of_routing_protocol)_$val(tcp_variant_input).nam

   #This command flushes the trace buffer and is typically called before the simulation run ends.
    $ns flush-trace
    close $trace_file
    close $namtrace_file
    set delay_file_to_save delay_files/$val(type_of_routing_protocol)_$val(tcp_variant_input).tr
    set pdr_to_save pdr_files/$val(type_of_routing_protocol)_$val(tcp_variant_input).tr
    set drop_to_save drop_files/$val(type_of_routing_protocol)_$val(tcp_variant_input).tr

    exec awk -f delay_calculator.awk $trace_file_path > $delay_file_to_save &
    exec awk -f pdr_caculator.awk $trace_file_path > $pdr_to_save &
    exec awk -f pdr_drop.awk $trace_file_path > $drop_to_save &

    puts "\n Everything is done Successfully... simulation is ending"
	exec nam $filenamez &
	exit 0
}

$ns run
