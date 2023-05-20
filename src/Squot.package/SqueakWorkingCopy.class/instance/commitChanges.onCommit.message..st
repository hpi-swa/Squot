changes-operations
commitChanges: aDictionary onCommit: aCommitOrNil message: aString
	^ (self serializeChanges: aDictionary onCommit: aCommitOrNil) prepareNewCommit
		message: aString;
		store;
		yourself