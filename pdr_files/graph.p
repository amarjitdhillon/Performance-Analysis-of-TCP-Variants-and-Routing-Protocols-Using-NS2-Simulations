set title "Comparative analysis of PDR"
set xlabel "Time(Seconds) "
set ylabel "packet Drop ratio"
set grid


plot "AODV_Reno.tr"  every :50 with lines , "AODV_Fack.tr"  every :50  with lines,"AODV_Linux.tr" every :50 with lines,"AODV_Sack1.tr" every :50 with lines,"AODV_Newreno.tr" with lines,"AODV_vegas.tr" every :50 with lines, "DSR_Fack.tr" with lines,"DSR_Sack1.tr" with lines,"DSR_Newreno.tr" with lines,"DSDV_Reno.tr" with lines, "DSDV_Fack.tr" with lines,"DSDV_Linux.tr" with lines,"DSDV_Sack1.tr" with lines,"DSDV_Newreno.tr" with lines,"DSDV_vegas.tr" with lines
