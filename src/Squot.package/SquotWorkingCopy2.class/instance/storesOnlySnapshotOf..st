testing
storesOnlySnapshotOf: anArtifact
	^ (self storeForArtifact: anArtifact) isMemberOf: SquotSnapshotStore