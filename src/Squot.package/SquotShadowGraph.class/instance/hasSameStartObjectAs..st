testing
hasSameStartObjectAs: aShadowGraph
	"Answer whether the other graph and I have the same start object (although it may be a
	different edition of it)."
	^ (self startName isNil or: [aShadowGraph startName = self startName])
		and: [self startName notNil
				or: [aShadowGraph startName isNil
						and: [self startShadow = aShadowGraph startShadow]]]