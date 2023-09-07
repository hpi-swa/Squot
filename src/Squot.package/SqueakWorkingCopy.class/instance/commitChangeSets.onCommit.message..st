changes-operations
commitChangeSets: aCollection onCommit: aCommitOrNil message: aString
	^ (self serializeChangeSets: aCollection onCommit: aCommitOrNil) prepareNewCommit
		message: aString;
		store;
		yourself