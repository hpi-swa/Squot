comparing
= aShadowGraph
	(aShadowGraph shadows collect: [:each | (aShadowGraph nameOf: each)]) = shadows keys
		ifFalse: [^ false].
	aShadowGraph startName = startName
		ifFalse: [^ false].
	^ (aShadowGraph squotDiffAgainst: self) squotHasChanges not