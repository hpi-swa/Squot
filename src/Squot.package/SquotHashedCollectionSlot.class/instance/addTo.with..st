patching
addTo: aHashedCollectionShadow with: aPatcher
	aHashedCollectionShadow addItemSlot: self.
	aPatcher addToGraph: self value.