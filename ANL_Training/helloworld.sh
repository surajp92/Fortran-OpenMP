
# gcc
gcc -o omp_hello -fopenmp helloworld.c 

# num of threads 
export OMP_NUM_THREADS=4

# run the executable
./omp_hello
