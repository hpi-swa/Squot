private diffing
diffFrom: leftShadow to: rightShadow ifNew: newBlock andInitialize: initBlock
	| diff left |
	left := leftShadow undecorated.
	diff := objectDiffs at: left
		ifPresent: [:existing | ^ existing]
		ifAbsentPut: newBlock.
	initBlock cull: diff cull: leftShadow cull: rightShadow.
	diff squotHasChanges ifTrue:
		[graphDiff addDiff: diff forObjectNamed: (shadowNames at: left ifAbsent: nil).
		self noteChanged: left].
	^ diff