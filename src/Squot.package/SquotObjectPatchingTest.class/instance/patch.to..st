testing
patch: original to: target
	"Modify original to be like target"
	| diff originalGraph targetGraph |
	originalGraph := capturer captureGraph: original.
	original become: target.
	[targetGraph := capturer captureGraph: original]
	ensure: [target become: original].
	diff := originalGraph squotDiffAgainst: targetGraph.
	^ (patcher apply: diff toLoadedGraph: originalGraph mutableCopy) startObject