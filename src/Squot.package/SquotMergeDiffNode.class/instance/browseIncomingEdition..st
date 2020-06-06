browsing
browseIncomingEdition: aWorkingCopy
	(self content incoming respondsTo: #isModification "does not need to respond true")
		"Special case for SquotContainerConflict..."
		ifTrue: [self content incoming isRemoval
				ifTrue: [self inform: 'Object does not exist.']
				ifFalse: [self browse: self content incoming right]]
		ifFalse: [self browse: self content incoming].