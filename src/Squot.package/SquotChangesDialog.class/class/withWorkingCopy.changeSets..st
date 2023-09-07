instance creation
withWorkingCopy: aWorkingCopy changeSets: aCollection
	^ self new
		workingCopy: aWorkingCopy;
		changeSets: aCollection;
		initializeFromWorkingCopy;
		yourself