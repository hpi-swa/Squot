changes-operations
serializeChangeSets: aCollection onCommit: aCommitOrNil
	| filesystem |
	filesystem := self filesystemOn: aCommitOrNil.
	aCollection do: [:each | each serializeInto: filesystem].
	self writeMappersFileInto: filesystem.
	^ filesystem