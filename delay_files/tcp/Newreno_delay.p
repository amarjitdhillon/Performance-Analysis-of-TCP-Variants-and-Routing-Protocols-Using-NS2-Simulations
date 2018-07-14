set title "Comparative analysis of end-to-end delay in Newreno TCP combinations"
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

plot "AODV_Newreno.tr" every 70 with lines title "AODV Newreno"
replot "DSDV_Newreno.tr" every 70 with lines title "DSDV Newreno"
replot "DSR_Newreno.tr" every 70 with lines title "DSR Newreno"
set term pngcairo size 1920,1080 
set output "tcp/graphs/Newreno_delay.png"
replot
