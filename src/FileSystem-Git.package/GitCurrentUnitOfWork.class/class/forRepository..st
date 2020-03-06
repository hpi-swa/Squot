accessing
forRepository: aGitRepository
	^ self value at: aGitRepository ifAbsent: []