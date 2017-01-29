initialize-release
newWorkingCopy
	^ self newRepository createWorkingCopy
		store: self newStore;
		yourself