changes-operations
serializeChanges: aDictionary onCommit: aCommitOrNil
	| filesystem |
	filesystem := self filesystemOn: aCommitOrNil.
	aDictionary keysAndValuesDo: [:mapper :changes |
		mapper serializeChanges: changes into: filesystem].
	^ filesystem