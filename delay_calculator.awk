
BEGIN {
}
{
	# finding sending-time from respective trace file
	if($1 == "s" && $4 == "AGT") {
		sent_time = $2;
	}  #if ends

	else if($1 == "r" && $4 == "AGT") {
                	# finding receiving_time from respective trace file
								receive_time= $2;
                end_to_end_delay = receive_time - sent_time;
                print $2 " " end_to_end_delay;
	} #elseif ends
}
END {
	# other Calculation can be performed here
}
