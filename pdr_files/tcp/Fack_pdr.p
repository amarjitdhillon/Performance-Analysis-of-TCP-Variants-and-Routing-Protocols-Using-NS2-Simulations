#!/usr/bin/gnuplot
set title "Comparative analysis of PDR% in Fack TCP combinations"
set xlabel "Time(Seconds)"
set ylabel "pdr(s)"
set xrange [0:50]
set yrange [0:100]
set grid
set title font "Times-Roman, 20"
set xtics font "Times-Roman, 18"
set ytics font "Times-Roman, 18"
set xlabel font "Times-Roman, 21"
set ylabel font "Times-Roman, 21"
set key font "Times-Roman, 18"

set style line 1 lt 2 lw 2 pt 3 ps 0.5

plot "AODV_Fack.tr" every 70 with lines title "AODV Fack"
replot "DSDV_Fack.tr" every 70 with lines title "DSDV Fack"
replot "DSR_Fack.tr" every 70 with lines title "DSR Fack"
set term pngcairo size 1920,1080 
set output "tcp/graphs/Fack_pdr.png"
replot
