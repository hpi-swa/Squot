instance creation
withChangeSet: aChangeSet model: aMultitextModel conflict: aMergeConflict
	^ (self withChangeSet: aChangeSet model: aMultitextModel)
		conflict: aMergeConflict;
		resetToConflict;
		yourself