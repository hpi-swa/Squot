instance creation
withChangeSet: aChangeSet conflict: aMergeConflict
	^ self
		withChangeSet: aChangeSet
		model: (SquotMCDefinitionModel withMapper: aChangeSet mapper)
		conflict: aMergeConflict