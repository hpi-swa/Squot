comparing
diffFrom: leftShadow to: rightShadow ifNew: newBlock andInitialize: initBlock
	| diff leftUndecorated |
	self deprecated: 'Rely on the walk (SquotGraphComparisonWalk) instead'.
	leftUndecorated := leftShadow undecorated.
	diff := objectDiffs at: leftUndecorated
		ifPresent: [:existing | ^ existing]
		ifAbsentPut: newBlock.
	initBlock cull: diff cull: leftShadow cull: rightShadow.
	diff squotHasChanges ifTrue:
		[graphDiff addDiff: diff forObjectNamed: (shadowNames at: leftUndecorated ifAbsent: nil).
		self noteChanged: leftUndecorated].
	^ diff