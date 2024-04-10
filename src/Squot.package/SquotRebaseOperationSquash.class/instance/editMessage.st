accessing
editMessage
	self followingOperations do: [:each |
		each createsCommit ifTrue: [^ true].
		(each modifiesPreviousCommit and: [each editsMessage]) ifTrue: [^ false]].
	^ true