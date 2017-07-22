Squot-diff-patching
applyTo: anObjectShadow with: aPatcher
	"Modifying variant of squotApplyTo:with:"
	anObjectShadow reassignSlot: key to: (aPatcher addToGraph: self replacementShadow)