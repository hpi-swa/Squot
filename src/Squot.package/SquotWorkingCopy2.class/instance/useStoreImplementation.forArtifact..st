accessing
useStoreImplementation: anObjectStoreImplementation forArtifact: anArtifact
	| oldStore newStore |
	oldStore := stores at: anArtifact id ifAbsent: [].
	oldStore ifNotNil: [self flag: #todo. "Should we do something about the old store?"].
	newStore := stores at: anArtifact id put: (anObjectStoreImplementation forArtifact: anArtifact).
	^ newStore