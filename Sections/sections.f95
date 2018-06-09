!program to used OpenMP section clause

program sections1

	use omp_lib
	implicit none
	
	integer 					:: num_threads=4
	real*8						:: t1, t2, ep
	integer 					:: thread_num
	integer, parameter 			:: m=10000, n= 10000
	real*8, dimension(m,n)		:: a, b, c, d, e
	integer 					:: i, j, k
		
	a = 1.0
	b = 0.0
	c = 0.0
	d = 0.0
	e = 0.0
		
	!$ call omp_set_num_threads(num_threads)
	call cpu_time(t1)

	!$omp parallel 
	!$omp sections private(i, j, thread_num)	
	
		!$omp section
		!$ thread_num = omp_get_thread_num()
		!$ print *, "Section 1: mat_sq started by thread number:", &
		!$ thread_num
		!do k = 1,m
			do j = 1, n
				do i = 1, m
					b(i,j) =  b(i,j)+a(i,j)*a(i,j)
				end do
			end do
		!end do
		!$ print *, "Section 1: mat_sq finished by thread number:", &
		!$ thread_num
		
		!$omp section
		!$ thread_num = omp_get_thread_num()
		!$ print *, "Section 2: mat_opt started by thread number:", &
		!$ thread_num
		!do k = 1,m
			do j = 1, n
				do i = 1, m
					c(i,j) =  a(i,j)*4*(i+1)
				end do
			end do
		!end do
		!$ print *, "Section 2: mat_opt finished by thread number:", &
		!$ thread_num
		
		!$omp section
		!$ thread_num = omp_get_thread_num()
		!$ print *, "Section 3: mat_square started by thread number:",&
		!$ thread_num
		!do k = 1,m
			do j = 1, n
				do i = 1, m
					d(i,j) =  a(i,j)**2 + 1.0
				end do
			end do
		!end do
		!$ print *, "Section 3: mat_square finished by thread number:",&
		!$ thread_num
		
		
		!$omp section
		!$ thread_num = omp_get_thread_num()
		!$ print *, "Section 4: mat_mul started by thread number:", &
		!$ thread_num
		!do k = 1,m
			do j = 1, n
				do i = 1, m
					e(i,j) =  a(i,j)*4
				end do
			end do
		!end do
		!$ print *, "Section 4: mat_mul finished by thread number:", &
		!$ thread_num
		
	!$omp end sections	
	!$omp end parallel
	
	call cpu_time(t2)
	ep = t2-t1
	!$ ep = ep/num_threads
	
	!$ print*, "OpenMP Model"
	print*, "TIme taken for execution", ep, "seconds"
	
end program sections1
