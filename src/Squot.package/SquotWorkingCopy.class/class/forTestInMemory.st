*Squot-Tests instance creation
forTestInMemory
	^ self newOnObjectMemory
		repository: SquotInMemoryRepository new;
		yourself