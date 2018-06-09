ls
rm *.o *~ *.exe
ls
gfortran -c  -fopenmp *.f95
#gfortran -c  *.f95
ls
gfortran *.o  -fopenmp -o privateclause.exe
#gfortran *.o -o privateclause.exe
ls
./privateclause.exe
