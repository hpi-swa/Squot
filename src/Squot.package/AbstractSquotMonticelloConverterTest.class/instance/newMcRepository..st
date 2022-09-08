running
newMcRepository: name

	^ mcRepositories add: (MCDictionaryRepository new
		description: name;
		yourself)