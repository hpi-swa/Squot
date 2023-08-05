accessing
storeImplementationForArtifact: anArtifact ifNone: errorBlock
	^ (ObjectStoreImplementationRegistry ifNil: [^ errorBlock value])
		detect: [:each | each canStore: anArtifact] ifNone: errorBlock