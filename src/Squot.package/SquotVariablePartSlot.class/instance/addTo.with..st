patching
addTo: anObjectShadow with: aPatcher
	anObjectShadow addVariablePartSlot: self.
	aPatcher addToGraph: self value.