adding and removing
add: anArtifactSnapshot
	self putArtifact: anArtifactSnapshot artifact.
	(self workingCopy storeForArtifact: anArtifactSnapshot artifact) putArtifact: anArtifactSnapshot.