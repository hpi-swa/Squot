legacy
packageDefinitionsOfArtifact: anArtifact
	(anArtifact respondsTo: #objectSnapshot) ifTrue: [^ self packageDefinitionsOfArtifact: anArtifact artifact].
	^ (self snapshotArtifact: anArtifact) objectSnapshot startShadow definitions