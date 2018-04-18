diffing low-level
diffFrom: leftShadow to: rightShadow basedOn: baseShadow ifNew: newBlock andInitialize: initBlock
	| diff left |
	diffedPair := baseShadow -> (leftShadow -> rightShadow).
	left := leftShadow undecorated.
	diff := objectDiffs at: left
		ifPresent: [:existing | ^ existing]
		ifAbsentPut: newBlock.
	initBlock cull: diff cull: leftShadow cull: rightShadow cull: baseShadow.
	diff squotHasChanges ifTrue:
		[graphDiff addDiff: diff forObjectNamed: (shadowNames at: left ifAbsent: nil).
		self noteChanged: left].
	^ diff