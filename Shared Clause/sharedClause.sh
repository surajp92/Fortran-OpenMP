ls
rm *.o *~ *.exe
ls
#gfortran -c -fopenmp *.f95
gfortran -c *.f95
ls
#gfortran *.o -fopenmp -o sharedClause.exe
gfortran *.o -o sharedClause.exe
ls
./sharedClause.exe
