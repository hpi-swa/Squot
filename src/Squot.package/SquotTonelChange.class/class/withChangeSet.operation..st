instance creation
withChangeSet: aChangeSet operation: anOperation
	^ (self withChangeSet: aChangeSet)
		operation: anOperation;
		yourself