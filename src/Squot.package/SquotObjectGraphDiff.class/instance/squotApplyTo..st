Squot-diff-patching
squotApplyTo: anObjectGraph
	| newGraph |
	self hasChanges ifFalse: [^ anObjectGraph].
	newGraph := anObjectGraph mutableCopy.
	diffs keysAndValuesDo:
		[:name :diff | newGraph applyDiff: diff toShadowNamed: name].
	newGraph refreshStartShadow.
	^ newGraph asShadowGraph