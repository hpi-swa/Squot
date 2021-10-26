testing
apply: anObjectGraphDiff to: anObject
	| graph |
	graph := capturer captureGraph: anObject.
	anObjectGraphDiff squotApplyToLoaded: graph mutableCopy.
	^ anObject