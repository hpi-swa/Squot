adding and removing
add: anArtifact
	store add: anArtifact.
	(store includesObjectAt: anArtifact path) "i. e. was really loaded" ifFalse:
		[^ self addUnloaded: anArtifact].
	self appendToLoadOrder: anArtifact path.
	^ SquotLoadedArtifact wrapping: (store artifactAt: anArtifact path) in: self