Squot-diff-patching
squotApplyTo: anObjectGraph
	| newGraph |
	newGraph := anObjectGraph mutableCopy.
	diffs keysAndValuesDo:
		[:name :diff | newGraph
			assign: name
			toShadow: (newGraph applyDiff: diff toShadowNamed: name) undecorated].
	newGraph startShadow: (newGraph shadowNamed: newGraph startName).
	^ newGraph asShadowGraph