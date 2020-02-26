accessing
forRepository: aGitRepository
	^ Registry at: aGitRepository ifAbsent: [self value]