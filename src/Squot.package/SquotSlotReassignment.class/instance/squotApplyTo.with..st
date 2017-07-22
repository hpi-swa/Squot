Squot-diff-patching
squotApplyTo: anObjectShadow with: aPatcher
	"Modifying variant of squotApplyTo:with:"
	anObjectShadow reassignSlot: key to: (aPatcher addToGraph: self replacementShadow)