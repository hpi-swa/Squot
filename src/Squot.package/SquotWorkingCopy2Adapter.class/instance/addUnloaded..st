adding and removing
addUnloaded: anArtifactSnapshot
	| unloadedArtifactSnapshot |
	unloadedArtifactSnapshot := anArtifactSnapshot copy.
	workingCopy putArtifact: unloadedArtifactSnapshot artifact;
		useStoreImplementation: SquotSnapshotStore forArtifact: unloadedArtifactSnapshot artifact.
	(workingCopy storeForArtifact: unloadedArtifactSnapshot artifact) putArtifact: unloadedArtifactSnapshot.