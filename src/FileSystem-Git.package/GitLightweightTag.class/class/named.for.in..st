instance creation
named: aString for: aGitCommit in: aGitRepository
	^ self new
		name: aString;
		object: aGitCommit;
		repository: aGitRepository;
		store;
		yourself