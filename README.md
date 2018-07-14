# Performance-Analysis-of-TCP-Variants-and-Routing-Protocols-Using-NS2-Simulations
Routing in an Ad-hoc network is a challenging task because source and destination nodes are mobile and thus routing decisions are to be changed dynamically when link failure or packet delay is encountered. As TCP protocols were initially designed for wired networks, so they are not able to deliver optimized performance, in the case of ad-hoc networks. For ensuring a reliable transfer, various variants of TCP must be used such as `TCP-Reno`, `TCP-Vegas` , `TCP-Westwood`, `TCP-New Reno`, `TCP-Tahoe`, `TCP-Sack` etc. Mobile ad-hoc network is a decentralized network consisting of various mobile nodes. Challenges in MANETS routing includes lack of apriori knowledge of underlying topology, which requires using the adaptive protocol to tackle route failures and packet loss scenarios.

`NS2` is a discrete event driven simulator which uses `TCL` as scripting language which will generate trace files that are analyzed using `TCL` and `awk` scripts and nam is used to visually show the simulation file using generated file.

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

