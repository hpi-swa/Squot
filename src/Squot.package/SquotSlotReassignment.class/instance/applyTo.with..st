Squot-diff-patching
applyTo: anObjectShadow with: aPatcher
	anObjectShadow reassignSlot: key to: (aPatcher addToGraph: self replacementShadow)