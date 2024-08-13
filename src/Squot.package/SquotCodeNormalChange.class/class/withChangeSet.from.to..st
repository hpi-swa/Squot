instance creation
withChangeSet: aChangeSet from: aString to: anotherString
	^ self
		withChangeSet: aChangeSet
		model: (SquotMCDefinitionModel withMapper: aChangeSet mapper)
		from: aString
		to: anotherString