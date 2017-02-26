accessing
nearestMappedParentTree: aPath do: aBinaryBlock ifNone: noneBlock
	aPath withParents reverseDo: [:each |
		(treeMap includesKey: each)
			ifTrue: [^ aBinaryBlock value: (treeMap at: each) value: each]].
	^ noneBlock value