adding and removing
putArtifact: anArtifact
	fakeStore atPath: anArtifact path put: anArtifact.
	^ workingCopy putArtifact: anArtifact