set title "Comparative analysis of Packets delivered percentage in AODV Routing Protocol and TCP variants combinations"
set xlabel "Time(Seconds)"
set ylabel "Packets delivered rate"
set xrange [0:50]
set yrange [0:100]
set grid
set title font "Times-Roman, 17"
set xtics font "Times-Roman, 18"
set ytics font "Times-Roman, 18"
set xlabel font "Times-Roman, 17"
set ylabel font "Times-Roman, 17"
set key font "Times-Roman, 16"
set style line 1 lt 2 lw 2 pt 3 ps 0.5

plot "AODV_Fack.tr" every 70 with lines title "AODV Fack"
replot "AODV_Linux.tr" every 70 with lines title "AODV Linux"
replot "AODV_Newreno.tr" every 70 with lines title "AODV Newreno"
replot "AODV_Reno.tr" every 70 with lines title "AODV Reno"
replot "AODV_Sack1.tr" every 70 with lines title "AODV Sack1"
replot "AODV_Vegas.tr" every 70 with lines title "AODV Vegas"
set term pngcairo size 1920,1080 
set output "rp/graphs/AODV_pdr.png"
replot
