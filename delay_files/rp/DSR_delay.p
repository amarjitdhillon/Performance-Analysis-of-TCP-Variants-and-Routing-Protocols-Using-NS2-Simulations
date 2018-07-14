set title "Comparative analysis of end-to-end delay in DSR Routing Protocol and TCP variants combinations"
set xlabel "Time(Seconds)"
set ylabel "end-to-end delay(s)"
set xrange [0:50]
set yrange [0:0.03]
set grid
set title font "Times-Roman, 20"
set xtics font "Times-Roman, 15"
set ytics font "Times-Roman, 15"
set xlabel font "Times-Roman, 15"
set ylabel font "Times-Roman, 15"
set key font "Times-Roman, 15"

set style line 1 lt 2 lw 2 pt 3 ps 0.5

plot "DSR_Fack.tr" every 70 with lines title "DSR Fack"
replot "DSR_Newreno.tr" every 70 with lines title "DSR Newreno"
replot "DSR_Reno.tr" every 70 with lines title "DSR Reno"
replot "DSR_Sack1.tr" every 70 with lines title "DSR Sack1"
set term pngcairo size 1920,1080 
set output "rp/graphs/DSR_delay.png"
replot
