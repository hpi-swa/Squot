tests
patched: anObject asIn: aBlock
	| diff patched originalGraph changedGraph |
	originalGraph := (capturer captureGraph: anObject) asShadowGraph.
	aBlock value.
	changedGraph := (capturer captureGraph: anObject) asShadowGraph.
	diff := originalGraph squotDiffAgainst: changedGraph.
	patched := patcher apply: diff toGraph: originalGraph mutableCopy.
	^ patched