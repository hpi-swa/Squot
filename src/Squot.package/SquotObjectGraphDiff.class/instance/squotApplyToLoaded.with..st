Squot-diff-patching
squotApplyToLoaded: anObjectGraph with: aPatcher
	| diffForStart |
	diffForStart := self startDiff.
	anObjectGraph applyDiff: diffForStart toStartObjectWith: aPatcher.
	diffs keysAndValuesDo: [:name :diff | diff ~~ diffForStart ifTrue: 
		[diff applyToObjectNamed: name inGraph: anObjectGraph with: aPatcher]].
	anObjectGraph refreshStartShadow.
	^ anObjectGraph