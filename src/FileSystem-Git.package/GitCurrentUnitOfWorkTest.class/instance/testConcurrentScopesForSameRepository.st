tests
testConcurrentScopesForSameRepository
	| repository uow uow2 process1 process2 semaphore1to2 semaphore2to1 finish failures |
	uow := '1'. uow2 := '2'.
	repository := GitRepository memory.
	semaphore1to2 := Semaphore new.
	semaphore2to1 := Semaphore new.
	finish := Semaphore new.
	failures := SharedQueue2 new.
	process1 := 
		[ | actual |
		GitCurrentUnitOfWork value: uow for: repository during:
			[semaphore1to2 signal. "(1)"
			semaphore2to1 wait. "(2)"
			uow == (actual := GitCurrentUnitOfWork forRepository: repository) ifFalse:
				[failures nextPut: {'Wrong unit of work for process 1'. actual}].
			semaphore1to2 signal. semaphore2to1 wait. "(3)"].
		(uow ~~ (actual := GitCurrentUnitOfWork forRepository: repository)) ifFalse:
			[failures nextPut: {'Unit of work not deactivated for process 1'. actual}].
		finish signal]
			fork.
	process2 :=
		[ | actual |
		semaphore1to2 wait. "(1)"
		GitCurrentUnitOfWork value: uow2 for: repository during:
			[semaphore2to1 signal. "(2)"
			(uow2 == (actual := GitCurrentUnitOfWork forRepository: repository)) ifFalse:
				[failures nextPut: {'Wrong unit of work for process 2'. actual}].
			semaphore2to1 signal. semaphore1to2 wait. "(3)"].
		(uow2 ~~ (actual := GitCurrentUnitOfWork forRepository: repository)) ifFalse:
			[failures nextPut: {'Unit of work not deactivated for process 2'. actual}].
		finish signal]
			fork.
	finish waitTimeoutSeconds: 1; waitTimeoutSeconds: 1.
	self deny: uow == (GitCurrentUnitOfWork forRepository: repository);
		deny: uow2 == (GitCurrentUnitOfWork forRepository: repository);
		assert: failures isEmpty description: ['', failures size, ' incorrect accesses'].