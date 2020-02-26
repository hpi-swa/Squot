instance creation
wrapping: aGitUnitOfWork for: aSquitRepository
	^ Registry
		at: aGitUnitOfWork
		ifAbsentPut:
			[self new
				gitUnitOfWork: aGitUnitOfWork;
				repository: aSquitRepository;
				yourself]