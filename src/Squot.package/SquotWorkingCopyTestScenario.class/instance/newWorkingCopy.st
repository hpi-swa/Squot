running
newWorkingCopy
	^ self repository createWorkingCopy
		store: self newStore;
		yourself