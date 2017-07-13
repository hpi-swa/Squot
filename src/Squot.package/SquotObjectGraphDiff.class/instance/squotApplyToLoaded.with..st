Squot-diff-patching
squotApplyToLoaded: anObjectGraph with: aPatcher
	diffs keysAndValuesDo: [:name :diff |
		aPatcher apply: diff fromGraphDiff: self toLoadedObjectNamed: name].
	^ anObjectGraph