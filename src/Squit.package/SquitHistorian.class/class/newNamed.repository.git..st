instance creation
newNamed: aString repository: aSquitRepository git: aGitRepository
	^ self new
		setName: nil repository: aSquitRepository git: aGitRepository;
		name: aString;
		yourself