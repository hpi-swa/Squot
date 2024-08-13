instance creation
withChangeSet: aChangeSet conflict: aMergeConflict
	^ self
		withChangeSet: aChangeSet
		model: (SquotPlaintextModel withMapper: aChangeSet mapper)
		conflict: aMergeConflict