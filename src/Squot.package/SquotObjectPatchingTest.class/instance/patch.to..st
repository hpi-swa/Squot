testing
patch: original to: target
	"Modify original to be like target"
	| diff originalGraph |
	originalGraph := capturer captureGraph: original.
	diff := originalGraph startShadow squotDiffAgainst: (capturer capture: target).
	^ patcher apply: diff toLoadedGraph: originalGraph