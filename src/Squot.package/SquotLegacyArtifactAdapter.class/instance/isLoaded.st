testing
isLoaded
	^ workingCopy isNil or: [((workingCopy storeForArtifact: artifact) isKindOf: SquotSnapshotStore) not]