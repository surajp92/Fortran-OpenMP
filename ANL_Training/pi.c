#include <omp.h>
#include <stdio.h>
static long num_steps = 100000; 
double step;
#define NUM_THREADS 2
void main ()
{ 
	int i, nthreads; double pi, sum[NUM_THREADS];
	step = 1.0/(double) num_steps;
	omp_set_num_threads(NUM_THREADS);
	int k;
	k = num_steps/NUM_THREADS;
	#pragma omp parallel
	{
	int i, id,nthrds;
	double x;
	int y;
	y = num_steps/omp_get_num_threads();
	
	id = omp_get_thread_num();
	nthrds = omp_get_num_threads();
	if (id == 0) nthreads = nthrds;
	for (i=id*k, sum[id]=0.0;i< k*(id+1); i=i+1)
	{
		x = (i+0.5)*step;
		sum[id] += 4.0/(1.0+x*x);
	}
	}
	for(i=0, pi=0.0;i<nthreads;i++) pi += sum[i] * step;
	printf("pi = %f\n", pi);
}
