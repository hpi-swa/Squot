*Squot-Tests
forTestInMemory
	| repo workingCopy |
	repo := SquotInMemoryRepository new.
	workingCopy := (self repository: repo)
		activeHistorian: (repo historianNamed: 'master');
		yourself.
	^ SquotWorkingCopy2Adapter for: workingCopy