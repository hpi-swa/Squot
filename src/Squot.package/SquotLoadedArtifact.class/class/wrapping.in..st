instance creation
wrapping: anArtifact in: aWorkingCopy
	^ self new
		storeArtifact: anArtifact;
		workingCopy: aWorkingCopy;
		yourself