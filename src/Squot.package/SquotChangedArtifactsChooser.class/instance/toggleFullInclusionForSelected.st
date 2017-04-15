operations
toggleFullInclusionForSelected
	(self stateOf: self selection) == #original
		ifTrue: [self includeSelected]
		ifFalse: [self excludeSelected].