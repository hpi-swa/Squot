operations
toggleFullInclusionForSelected
	(self stateOf: self selectedArtifact) == #original
		ifTrue: [self includeSelected]
		ifFalse: [self excludeSelected].