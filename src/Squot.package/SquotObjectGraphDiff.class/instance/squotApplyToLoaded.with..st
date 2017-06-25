Squot-diff-patching
squotApplyToLoaded: anObject with: aPatcher
	diffs keysAndValuesDo: [:name :diff |
		aPatcher apply: diff fromGraphDiff: self toLoadedObjectNamed: name].
	^ anObject