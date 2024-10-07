changes-operations
commitChangeSets: aCollection
onCommit: aCommitOrNil
message: aString
parents: anotherCollection
	| fileSystem |
	fileSystem := self serializeChangeSets: aCollection onCommit: aCommitOrNil.
	^ fileSystem prepareNewCommit
		message: aString withUnixLineEndings;
		parents: (anotherCollection collect: #asHexHash);
		store;
		yourself