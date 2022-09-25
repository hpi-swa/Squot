accessing
storeForArtifact: anArtifact
	| store storeImplementation |
	store := stores at: anArtifact id ifAbsent: [].
	store ifNotNil: [^ store].
	store := stores detect: [:each | each canStore: anArtifact] ifNone: [].
	store ifNotNil: [stores at: anArtifact id put: store. ^ store].
	storeImplementation := self storeImplementationForArtifact: anArtifact ifNone: [self error: 'No suitable store for artifact'].
	store := stores at: anArtifact id put: (storeImplementation forArtifact: anArtifact).
	^ store