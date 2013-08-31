import cStringIO
import cPickle

import pickle
import StringIO

import timeit
import itertools
import os

class dictOfSize(object):
    def __init__(self,p,sio,length):
        
        self.unpickle = {}
        for i in xrange(length):
            self.unpickle[str(i)] = {}
            
            for j in xrange(0,8):
                self.unpickle[str(i)][str(j)] = 32*'0'
            
        self.unpickle = buffer(p.dumps(self.unpickle,-1))
        self.p = p
        self.sio = sio
        
    def __call__(self):
        self.p.load(self.sio.StringIO(self.unpickle))

picklers = [pickle,cPickle]
sios = [StringIO,cStringIO]            

def benchmark(obj):
    minTime = 0.1
    iterations = 1
    modules = list(itertools.product(picklers,sios))
    modules.reverse()
    
    while True:
        results = {}
        for p,sio in modules:
            results['%s %s' % (p.__name__,sio.__name__,)] = []
            
        for l in range(4,16):
            l = 2**l
            l -= 1
            for p,sio in modules:
                t = timeit.Timer(stmt='bmark()',setup='gc.enable();import unpicklingBuffers as m; bmark = m.%s(m.%s,m.%s,%i)' % (obj.__name__,p.__name__,sio.__name__,l,))
                runtime = t.timeit(iterations)

                if runtime < minTime:
                    iterations *= minTime/runtime
                    iterations *= 1.01
                    iterations = int(iterations)
                    break
                
                results['%s %s' % (p.__name__,sio.__name__,)].append((iterations,l,runtime))
                print '%s %s %i %i %f' % ( p.__name__,sio.__name__, l, iterations, runtime,)
        else:
            break
            
    with open(obj.__name__ +'.data','w') as fout:
        for name,resultset in results.iteritems():
            fout.write('#%s\n' % name)
            
            for r in resultset:
                fout.write('%i %i %f\n' % r)
            fout.write('\n\n')
    
if __name__ == '__main__':
    benchmark(dictOfSize)

        
