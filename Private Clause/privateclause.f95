!program to understand Private, firstprivate, lastprivate and ordered 
! clauses

program privateclause

	use omp_lib
	implicit none
	
	!Private Clause:
	! Each thread has its own copy of variables to modify
	! Values are deleted after the scope of clause
	! private variables are auto-initialized before usage
	! after scope, the variables assume the value prior to the scope
	
	! firstprivate clause:
	! Each thread has its own copy of variables to modify
	! Values are deleted after the scope of the clause
	! private variables must be initialized before usage or garbage 
	! value is used
	! after scope, the variables assumes the value prior to the scope
	
	! lastprivate clause:
	! Each thread has its own copy of variables to modify
	! Values are deleted after the scope of the clause
	! private variables need not be initialized before usage
	! after scope the variables assume the last value inside the scope
	
	integer, parameter 		:: num_threads=4
	integer					:: thread_num=17
	integer					:: i
			
	!$ call omp_set_num_threads(num_threads)
	
!	print *, "Thread value before private:", thread_num
!	!$omp parallel private(thread_num)
!			print*, "thread value=", thread_num
!			!$ thread_num = omp_get_thread_num()
!			!$ print *, "Active thread: ", thread_num
!			!$ thread_num = thread_num + 100
!			!$ print *, "thread = ", omp_get_thread_num(), "and &
!			!$ thread value = ", thread_num
!	!$omp end parallel
!	print *, "Thread value after private:", thread_num
	
	
!	print *, "Thread value before private:", thread_num
!	!$omp parallel firstprivate(thread_num)
!			print*, "thread value=", thread_num
!			!$ thread_num = omp_get_thread_num()
!			!$ print *, "Active thread: ", thread_num
!			!$ thread_num = thread_num + 100
!			!$ print *, "thread = ", omp_get_thread_num(), "and &
!			!$ thread value = ", thread_num
!	!$omp end parallel
!	print *, "Thread value after private:", thread_num
	
	print *, "Thread value before private:", thread_num
	!!$omp parallel do lastprivate(thread_num) ordered
	!$omp parallel do lastprivate(thread_num) 
		
		do i = 1, 12
		!!$omp ordered
		!$omp critical
		print*, "thread value=", thread_num
			!$ thread_num = omp_get_thread_num()
			!$ thread_num = thread_num + 100
			!$ print *, "thread = ", omp_get_thread_num(), "and &
			!$ thread value = ", thread_num
		!!$omp end ordered
		!$omp end critical
		end do
	!$omp end parallel do
	print *, "Thread value after private:", thread_num
	
end program privateclause
