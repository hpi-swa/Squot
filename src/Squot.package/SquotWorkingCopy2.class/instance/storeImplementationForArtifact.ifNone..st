accessing
storeImplementationForArtifact: anArtifact ifNone: errorBlock
	^ ObjectStoreImplementationRegistry detect: [:each | each canStore: anArtifact] ifNone: errorBlock