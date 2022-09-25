accessing
snapshotArtifact: anArtifact
	self flag: #todo. "Unit of work caching?"
	self flag: #todo. "Still conflating stores and snapshots here... WorkingCopy should behave like a store (if anything), but snapshotArtifact: is otherwise only understood by snapshots."
	self isThisEverCalled.
	^ (self storeForArtifact: anArtifact) readArtifact: anArtifact