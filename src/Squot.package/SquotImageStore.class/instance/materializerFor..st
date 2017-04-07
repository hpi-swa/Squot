private materializing
materializerFor: anArtifact
	| loader |
	loader := Environment current
		valueOf: (anArtifact storeInfo at: #loader ifAbsent: [])
		ifAbsent: [self].
	loader ~~ self ifTrue: [loader := loader new].
	^ loader 