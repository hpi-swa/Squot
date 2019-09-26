comparing
squotDiffAgainst: rightShadowGraph withBase: baseShadowGraph
	^ (mergeBlock ifNil: [self defaultMergeBlock]) cull: rightShadowGraph cull: baseShadowGraph cull: self