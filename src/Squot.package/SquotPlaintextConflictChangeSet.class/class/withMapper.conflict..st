instance creation
withMapper: aMapper conflict: aMergeConflict
	^ (self withMapper: aMapper)
		setChangeWith: aMergeConflict;
		yourself