set terminal png size 1024,768
set key left top Left title 'Legend' box 3

set output 'linear.png'
plot 'dictOfSize.data' index 0 using 2:3 title 'cPickle cStringIO' with lines, \
 'dictOfSize.data' index 1 using 2:3 title 'cPickle StringIO'  with lines, \
 'dictOfSize.data' index 2 using 2:3 title 'pickle cStringIO' with lines, \
 'dictOfSize.data' index 3 using 2:3 title 'pickle StringIO' with lines;

set logscale y
set key right bottom Left title 'Legend' box 3
set output 'log.png'
plot 'dictOfSize.data' index 0 using 2:3 title 'cPickle cStringIO' with lines, \
 'dictOfSize.data' index 1 using 2:3 title 'cPickle StringIO'  with lines, \
 'dictOfSize.data' index 2 using 2:3 title 'pickle cStringIO' with lines, \
 'dictOfSize.data' index 3 using 2:3 title 'pickle StringIO' with lines;
