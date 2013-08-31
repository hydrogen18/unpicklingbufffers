set terminal png size 1024,768
set key left top Left title 'Legend' box 3

set xlabel 'Pickled Dictionary size'
set ylabel 'Seconds To Unpickle'
set title 'Unpickling from a buffer(lower is better)'

set output 'linear.png'
plot 'dictOfSize.data' index 0 using 2:($3/$1) title 'cPickle cStringIO' with linespoints, \
 'dictOfSize.data' index 1 using 2:($3/$1) title 'pickle cStringIO'  with linespoints, \
 'dictOfSize.data' index 2 using 2:($3/$1) title 'cPickle StringIO' with linespoints, \
 'dictOfSize.data' index 3 using 2:($3/$1) title 'pickle StringIO' with linespoints;

set logscale y
set key right bottom Left title 'Legend' box 3
set output 'log.png'
plot 'dictOfSize.data' index 0 using 2:($3/$1) title 'cPickle cStringIO' with linespoints, \
 'dictOfSize.data' index 1 using 2:($3/$1) title 'pickle cStringIO'  with linespoints, \
 'dictOfSize.data' index 2 using 2:($3/$1) title 'cPickle StringIO' with linespoints, \
 'dictOfSize.data' index 3 using 2:($3/$1) title 'pickle StringIO' with linespoints;
