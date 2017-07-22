Squot-diff-patching
squotApplyToLoaded: anObjectGraph with: aPatcher
	diffs keysAndValuesDo: [:name :diff |
		anObjectGraph applyDiff: diff toObjectNamed: name with: aPatcher].
	anObjectGraph refreshStartShadow.
	^ anObjectGraph