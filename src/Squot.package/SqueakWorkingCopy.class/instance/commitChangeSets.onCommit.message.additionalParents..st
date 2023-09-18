changes-operations
commitChangeSets: aCollection onCommit: aCommitOrNil message: aString additionalParents: anotherCollection
	| fileSystem |
	fileSystem := self serializeChangeSets: aCollection onCommit: aCommitOrNil.
	anotherCollection do: [:each | fileSystem addParent: each asHexHash].
	^ fileSystem prepareNewCommit
		message: aString;
		store;
		yourself