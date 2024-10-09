instance creation
withChangeSet: aChangeSet conflict: aMergeConflict
	^ (self withChangeSet: aChangeSet)
		conflict: aMergeConflict;
		resetToConflict;
		yourself