changes-operations
commitChangeSets: aCollection
onCommit: aCommitOrNil
message: aString
additionalParents: anotherCollection
onlyAdditionalParents: aBoolean
	| fileSystem commit |
	fileSystem := self serializeChangeSets: aCollection onCommit: aCommitOrNil.
	aBoolean ifFalse: [anotherCollection do: [:each | fileSystem addParent: each asHexHash]].
	commit := fileSystem prepareNewCommit
					message: aString;
					yourself.
	aBoolean ifTrue: [commit parents: (anotherCollection collect: #asHexHash)].
	commit store.
	^ commit