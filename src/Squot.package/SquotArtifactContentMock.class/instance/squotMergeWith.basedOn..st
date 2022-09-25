comparing
squotMergeWith: rightShadowGraph basedOn: baseShadowGraph
	^ (mergeBlock ifNil: [self defaultMergeBlock]) cull: rightShadowGraph cull: baseShadowGraph cull: self