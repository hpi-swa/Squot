accessing
isCommitModified
	self followingOperations do: [:each |
		each createsCommit ifTrue: [^ false].
		each modifiesPreviousCommit ifTrue: [^ true]].
	^ false