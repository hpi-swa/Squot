instance creation
withChangeSet: aChangeSet model: aMultitextModel
	^ (self withChangeSet: aChangeSet)
		model: aMultitextModel;
		yourself