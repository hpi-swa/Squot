accessing
deletesCommit
	^ self createsCommit not and: [self modifiesPreviousCommit not]