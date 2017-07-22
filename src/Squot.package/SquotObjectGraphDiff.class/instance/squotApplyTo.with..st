Squot-diff-patching
squotApplyTo: anObjectGraph with: aPatcher
	"Apply my changes to aShadow (the representation of an object in a snapshot) and answer the result."
	diffs keysAndValuesDo: [:objectName :diff |
		anObjectGraph applyDiff: diff toShadowNamed: objectName with: aPatcher].
	anObjectGraph startShadow: (anObjectGraph shadowNamed: startObjectName).