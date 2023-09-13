as yet unclassified
= anObject
	^ self species = anObject species
		and: [self commit = anObject commit]
		and: [self fsgitRepository = anObject fsgitRepository]