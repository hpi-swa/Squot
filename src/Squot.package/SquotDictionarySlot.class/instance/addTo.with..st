patching
addTo: aDictionaryShadow with: aPatcher
	aPatcher addToGraph: self association.
	aDictionaryShadow addAssociation: self association with: aPatcher.