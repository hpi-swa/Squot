Squot-diff-patching
squotApplyTo: anObjectGraph
	| newGraph |
	newGraph := anObjectGraph mutableCopy.
	diffs keysAndValuesDo:
		[:name :diff | newGraph applyDiff: diff toShadowNamed: name].
	newGraph refreshStartShadow.
	^ newGraph asShadowGraph