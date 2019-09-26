Squot-shadow
sameIn: otherShadowGraph asIn: originShadowGraph ifAbsent: aBlock
	^ self sameIn: otherShadowGraph
		withName: (originShadowGraph nameOf: self ifAbsent: [])
		ifAbsent: [aBlock value]