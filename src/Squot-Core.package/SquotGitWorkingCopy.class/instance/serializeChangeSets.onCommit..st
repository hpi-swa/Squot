changes-operations
serializeChangeSets: aCollection onCommit: aCommitOrNil
	| filesystem |
	filesystem := self filesystemOn: aCommitOrNil.
	aCollection
		do: [:each | each serializeInto: filesystem]
		displayingProgress: [:each | 'Saving changes from {1}' format: {each mapper}].
	^ filesystem