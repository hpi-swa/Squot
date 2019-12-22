*Squot-Tests instance creation
forTestInMemory
	| repo |
	^ self newOnObjectMemory
		repository: (repo := SquotInMemoryRepository new);
		loadedHistorian: (repo historianNamed: 'master');
		yourself