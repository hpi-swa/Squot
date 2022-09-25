accessing
snapshot
	| projectCopy snapshots snapshotStore |
	projectCopy := project copy.
	snapshots := projectCopy artifacts collect:
		[:each | 
		self flag: #todo. "Unit of work caching?"
		(self storeForArtifact: each) readArtifact: each].
	snapshotStore := SquotSnapshotStore project: projectCopy artifactSnapshots: snapshots.
	^ SquotProjectSnapshot fromStore: snapshotStore