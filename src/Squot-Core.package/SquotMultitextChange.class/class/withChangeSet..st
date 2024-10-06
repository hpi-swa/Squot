instance creation
withChangeSet: aChangeSet
	^ (super withChangeSet: aChangeSet)
		model: (self modelClass withMapper: aChangeSet mapper);
		yourself