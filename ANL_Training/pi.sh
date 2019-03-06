
# gcc
gcc -o omp_pi -fopenmp pi.c 

# num of threads 
export OMP_NUM_THREADS=4

# run the executable
./omp_pi
