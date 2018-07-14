set title "Comparative analysis of Packets delivered percentage in DSR Routing Protocol and TCP variants combinations"
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

plot "DSR_Fack.tr" every 70 with lines title "DSR Fack"
replot "DSR_Newreno.tr" every 70 with lines title "DSR Newreno"
replot "DSR_Reno.tr" every 70 with lines title "DSR Reno"
replot "DSR_Sack1.tr" every 70 with lines title "DSR Sack1"
set term pngcairo size 1920,1080 
set output "rp/graphs/DSR_pdr.png"
replot
