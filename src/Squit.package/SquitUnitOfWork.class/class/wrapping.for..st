instance creation
wrapping: aGitUnitOfWork for: aSquitRepository
	| holder instance |
	(GitFeatureFlags useUnitOfWorkInterface not and: [aGitUnitOfWork isKindOf: GitRepository]) ifTrue:
		[^ self fallbackForRepository: aGitUnitOfWork for: aSquitRepository].
	holder :=
		Registry
			at: aGitUnitOfWork
			ifAbsentPut: [WeakArray with: nil].
	^ (holder at: 1) ifNil:
		[holder at: 1 put:
			(instance := self new
				gitUnitOfWork: aGitUnitOfWork;
				repository: aSquitRepository;
				yourself)].