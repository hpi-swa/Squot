instance creation
workingDiff: workingArtifactDiff conflictingDiff: incomingArtifactDiff
	^ self new
		workingDiff: workingArtifactDiff;
		incomingDiff: incomingArtifactDiff;
		yourself