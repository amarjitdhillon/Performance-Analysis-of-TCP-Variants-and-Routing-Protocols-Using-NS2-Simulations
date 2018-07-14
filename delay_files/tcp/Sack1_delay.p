set title "Comparative analysis of end-to-end delay in Sack1 TCP combinations"
set xlabel "Time(Seconds)"
set ylabel "end-to-end delay(s)"
set xrange [0:50]
set yrange [0:0.06]
set grid
set title font "Times-Roman, 20"
set xtics font "Times-Roman, 18"
set ytics font "Times-Roman, 18"
set xlabel font "Times-Roman, 20"
set ylabel font "Times-Roman, 20"
set key font "Times-Roman, 15"
set style line 1 lt 2 lw 2 pt 3 ps 0.5

plot "AODV_Sack1.tr" every 70 with lines title "AODV Sack1"
replot "DSDV_Sack1.tr" every 70 with lines title "DSDV Sack1"
replot "DSR_Sack1.tr" every 70 with lines title "DSR Sack1"
set term pngcairo size 1920,1080 
set output "tcp/graphs/Sack1_delay.png"
replot
