clear
ls
# Remove old executables
rm *.exe
ls

# COmpile and Build the executable
/usr/bin/gcc -o omp_helloc -fopenmp helloworld.c

# export OMP_NUM_THREADS = 2
# Run the executable
./omp_helloc
