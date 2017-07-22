testing
patch: original to: target
	"Modify original to be like target"
	| diff originalGraph |
	originalGraph := capturer captureGraph: original.
	diff := originalGraph squotDiffAgainst: (capturer captureGraph: target).
	^ (patcher apply: diff toLoadedGraph: originalGraph) startObject