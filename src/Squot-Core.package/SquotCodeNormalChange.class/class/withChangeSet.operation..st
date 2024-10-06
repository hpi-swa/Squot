instance creation
withChangeSet: aChangeSet operation: anOperation
	^ self
		withChangeSet: aChangeSet
		from: anOperation baseDefinition
		to: anOperation targetDefinition