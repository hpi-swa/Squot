tests
patched: anObject asIn: aBlock
	| diff patched originalGraph changedGraph |
	originalGraph := (capturer captureGraph: anObject) asShadowGraph.
	aBlock value.
	changedGraph := (capturer captureGraph: anObject) asShadowGraph.
	diff := originalGraph squotDiffAgainst: changedGraph.
	patched := diff squotApplyTo: originalGraph mutableCopy.
	^ patched