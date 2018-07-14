set title "Comparative analysis of end-to-end delay in AODV Routing Protocol and TCP variants combinations"
set xlabel "Time(Seconds)"
set ylabel "end-to-end delay(s)"
set xrange [0:50]
set yrange [0:0.08]
set grid
set title font "Times-Roman, 20"
set xtics font "Times-Roman, 15"
set ytics font "Times-Roman, 15"
set xlabel font "Times-Roman, 15"
set ylabel font "Times-Roman, 15"
set key font "Times-Roman, 15"

set style line 1 lt 2 lw 2 pt 3 ps 0.5

plot "AODV_Fack.tr" every 70 with lines title "AODV Fack"
replot "AODV_Linux.tr" every 70 with lines title "AODV Linux"
replot "AODV_Newreno.tr" every 70 with lines title "AODV Newreno"
replot "AODV_Reno.tr" every 70 with lines title "AODV Reno"
replot "AODV_Sack1.tr" every 70 with lines title "AODV Sack1"
replot "AODV_Vegas.tr" every 70 with lines title "AODV Vegas"
set term pngcairo size 1920,1080 
set output "rp/graphs/AODV_delay.png"
replot
