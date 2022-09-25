adding and removing
unloadArtifact: anArtifact
	project removeArtifactAt: anArtifact id.
	(self storeForArtifact: anArtifact) removeArtifact: anArtifact.
	stores removeKey: anArtifact id.
	