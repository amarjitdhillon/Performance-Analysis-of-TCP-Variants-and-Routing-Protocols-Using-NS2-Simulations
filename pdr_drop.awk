BEGIN {

	# Calculation of packet Delivery ratio
	# initialization

	rcvd_pkt = 0;
	gnrt_pkt = 0;

}

{
	# Pattern and action
	if($1 == "s" && $4 == "AGT") {
		gnrt_pkt++;
	}
	else if($1 == "r" && $4 == "AGT") {
		rcvd_pkt++;
        drop_ratio = gnrt_pkt-rcvd_pkt/gnrt_pkt;
        print $2 "  "drop_ratio;
	}
}
END {
	# Calculation and result printing
}
