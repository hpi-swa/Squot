patching
addTo: anObjectShadow with: aPatcher
	anObjectShadow addInstVarSlot: self.
	aPatcher addToGraph: self value.