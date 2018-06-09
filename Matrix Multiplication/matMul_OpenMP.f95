! Program to display a hello world message in fortran using OpenMP

program parallel_do_ex

	use omp_lib
	implicit none
	
	integer :: num_threads=4
	integer :: thread_num=0
	
	integer, parameter :: m=100, n=100000, o=100
	integer 		   :: i, j, k
	real*8, dimension(1:m, 1:n) :: a
	real*8, dimension(1:n, 1:o) :: b
	real*8, dimension(1:m, 1:n) :: c
	real*8						:: t1, t2, ep1, ep2
	
	a = 1.0
	b = 1.0
	c = 0.0
	
	call cpu_time(t1)
	
	!$omp parallel do
		do i = 1, m
			do j = 1, o
				do k = 1, n
					c(i,j) = c(i,j)+a(i,k)*b(k,j)
				end do
			end do
		end do
	!$omp end parallel do
	
	call cpu_time(t2)
	ep1 = t2-t1
	
	!$ ep2 = ep1/num_threads
	
	print *, "Parallel TIme =", ep2
	print *, "Total TIme =", ep1
end program parallel_do_ex
