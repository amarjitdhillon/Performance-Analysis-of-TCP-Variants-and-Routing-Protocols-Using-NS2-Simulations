# Performance-Analysis-of-TCP-Variants-and-Routing-Protocols-Using-NS2-Simulations
The project is based on the implementation of `AODV`, `DSR` and `DSDV` protocols along with TCP agents such as Reno, New Reno, Fack, Sack1, and Linux.The goal of the project is to find the correct combination of routing protocol and TCP variant. Routing in an Ad-hoc network is a challenging task because the source and destination nodes are mobile and thus routing decisions are to be changed dynamically when link failure or packet delay is encountered. As TCP protocols were initially designed for wired networks, so they are not able to deliver optimized performance, in the case of ad-hoc networks. For ensuring a reliable transfer, various variants of TCP must be used such as `TCP-Reno`, `TCP-Vegas`, `TCP-Westwood`, `TCP-New Reno`, `TCP-Tahoe`, `TCP-Sack` etc. Mobile ad-hoc network is a decentralized network consisting of various mobile nodes. 

## Refer to the project report pdf file (project report file.pdf), available on the root folder for more details 

#  Getting Started
These steps will help you to run the project on your local machine for testing purposes. The project is tested on Ubuntu 16.04 LTS and MAC operating system.

# Prerequisites
## Ubuntu OS 
 1. NS 2.35
  2. Gnuplot build with X-11 or qt5
  3. Perl for running file for additional parameters graph file (optional)

## For Mac
1. Latest Xcode
2. NS 2.35
 3. Gnuplot with Qt
 4. Xquartz
 5. Perl for running file for additional parameters graph file (optional)

# Installing 
You need to install all the required pre-requisites and set their environment path respectively. then

1. First of all goto project folder in a terminal by` cd` project command
2. Type ns start_program.tcl
3. Provide the input on the screen as required for example 1 for AODV and then  1 for TCP/RENO
4. The resulting files will be generated in folders pdr_files, delay_files, nam_files
5. Change directory to pdr_files or delay_files to generate files
6. Type ns rp_graph_generator_delays.tcl for graphs plotting of same Routing protocol with different TCP agents. if an error comes then make a folder named `rp` in delay_files and then "graphs" in `rp`
7. Type ns tcp_graph_generator_delays.tcl for graphs plotting of same TCP protocol with different routing protocols. if the error comes then make a folder named `TCP` in delay_files and then "graphs" in Tcl folder.
9. Change directory to pdr_files
8. Type ns rp_graph_generator_pdr.tcl for graphs plotting of same Routing protocol with different TCP agents for calculating `pdr`. if an error comes then make a folder named `rp` in pdr_files and then graphs in `rp`
9. Type ns tcl_graph_generator_pdr.tcl for graphs plotting of same TCP protocol with different routing protocols for calculating `pdr`. if an error comes then make a folder named `rp` in pdr_files and then "graphs" in `rp`

# Built With 
Network Simulator 2 - The network simulator used
NAM - Network animator for viewing the simulation animation
Gnuplot - The open source graph plotting framework
TCL - scripting language for network simulation
AWK - Scripting language for manipulating and analyzing data

#  Authors 
Amarjit Dhillon
Ranjit Singh Saini

#  Future Work 
Packet Drop ratio, throughput, and other parameters can be calculated for the generated trace file

# Acknowledgments
We would like to thank people on stackoverflow.com who guided us in solving some initial problems like the correct format of trace file and solutions to `Perl` conversion of graph file which can be used for additional parameters like throughput. Lastly, we would like to thanks our professor Dr. Melike Erol-Kantarci to guide us at every step.

Some of imperative files in this simulation are as below
1. Start_program.tcl
2. Mobility.tcl
3. Topology.tcl
4. rp_graph_generator_pdr.tcl
5. tcp_graph_generator_pdr.tcl
6. rp_graph_generator_delay.tcl
7. tcp_graph_generator_delay.tcl
8. delay_calculator.awk
9. pdr_caculator.awk
10. pdr_drop.awk

