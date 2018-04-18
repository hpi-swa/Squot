patching
applyTo: aShadowGraph
	choice ifNil: [self error: 'Conflict must be resolved first'].
	^ (self instVarNamed: choice) applyTo: aShadowGraph