


BEGIN {
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
        pdr=rcvd_pkt/gnrt_pkt*100;
        print $2 "  "pdr;
	}
}
END {
}
