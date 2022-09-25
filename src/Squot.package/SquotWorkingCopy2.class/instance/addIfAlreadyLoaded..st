adding and removing
addIfAlreadyLoaded: anArtifact
	(self project includesArtifactWithId: anArtifact id) ifTrue: [^ self].
	((self storeForArtifact: anArtifact) includesArtifact: anArtifact)
		ifTrue: [self putArtifact: anArtifact].