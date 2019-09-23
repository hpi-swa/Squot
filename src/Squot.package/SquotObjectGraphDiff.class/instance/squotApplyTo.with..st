Squot-diff-patching
squotApplyTo: anObjectGraph with: aPatcher
	| diffForStart |
	diffForStart := self startDiff.
	anObjectGraph startShadow:
		(anObjectGraph applyDiff: diffForStart toStartShadowWith: aPatcher).
	diffs keysAndValuesDo: [:objectName :diff | diff ~~ diffForStart ifTrue: 
		[anObjectGraph applyDiff: diff toShadowNamed: objectName with: aPatcher]].