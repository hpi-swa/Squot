comparing
squotDiffAgainst: aShadowGraph
	^ (diffBlock ifNil: [self defaultCompareBlock]) cull: aShadowGraph cull: self