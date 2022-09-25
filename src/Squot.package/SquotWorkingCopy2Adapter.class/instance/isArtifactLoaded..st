testing
isArtifactLoaded: anArtifact
	| store |
	store := workingCopy storeForArtifact: anArtifact.
	(store isKindOf: SquotSnapshotStore) ifTrue: [^ false].
	^ store includesArtifact: anArtifact