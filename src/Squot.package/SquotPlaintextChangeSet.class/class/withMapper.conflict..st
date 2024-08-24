instance creation
withMapper: aMapper conflict: aMergeConflict
	^ (self withMapper: aMapper)
		setChangeWithConflict: aMergeConflict;
		yourself