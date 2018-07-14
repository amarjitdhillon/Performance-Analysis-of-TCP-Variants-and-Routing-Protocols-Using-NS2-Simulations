set title "Comparative analysis of Packets delivered percentage in DSDV Routing Protocol and TCP variants combinations"
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

plot "DSDV_Fack.tr" every 70 with lines title "DSDV Fack"
replot "DSDV_Linux.tr" every 70 with lines title "DSDV Linux"
replot "DSDV_Newreno.tr" every 70 with lines title "DSDV Newreno"
replot "DSDV_Reno.tr" every 70 with lines title "DSDV Reno"
replot "DSDV_Sack1.tr" every 70 with lines title "DSDV Sack1"
replot "DSDV_Vegas.tr" every 70 with lines title "DSDV Vegas"
set term pngcairo size 1920,1080 
set output "rp/graphs/DSDV_pdr.png"
replot
