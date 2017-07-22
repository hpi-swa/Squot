private diffing
diffFrom: leftShadow to: rightShadow ifNew: newBlock andInitialize: initBlock
	| diff |
	diff := (comparedObjects at: leftShadow undecorated ifAbsentPut: [Dictionary new])
		at: rightShadow undecorated
		ifPresent: [:existing | ^ existing]
		ifAbsentPut: newBlock.
	objectDiffs at: leftShadow undecorated put: diff.
	initBlock cull: diff cull: leftShadow cull: rightShadow.
	diff squotHasChanges ifTrue:
		[resultPatch addDiff: diff forObjectNamed: (shadowNames at: leftShadow undecorated ifAbsent: nil)].
	^ diff