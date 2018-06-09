ls
rm *.o *~ *.exe
ls
gfortran -c -mcmodel=large -fopenmp *.f95
#gfortran -c  *.f95
ls
gfortran *.o -mcmodel=large -fopenmp -o sections.exe
#gfortran *.o -o sections.exe
ls
./sections.exe
