instance creation
into: aWorkingCopy merge: incomingObjectContainer basedOn: baseObjectContainer
	^ self new
		workingCopy: aWorkingCopy;
		incomingContainer: incomingObjectContainer;
		baseContainer: baseObjectContainer;
		computeDifferences;
		yourself