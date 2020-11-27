instance creation
wrapping: anArtifact in: aWorkingCopy
	^ self new
		setArtifact: anArtifact
		workingCopy: aWorkingCopy;
		yourself