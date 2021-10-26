testing
hasSameStartObjectAs: aShadowGraph
	"Answer whether the other graph and I have the same start object (although it may be a
	different edition of it)."
	^ self startName
		ifNil: [aShadowGraph startName isNil and: [self startShadow = aShadowGraph startShadow]]
		ifNotNil: [aShadowGraph startName = self startName]