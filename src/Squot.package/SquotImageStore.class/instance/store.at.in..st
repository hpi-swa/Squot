private snapshot building
store: anObject at: path in: aSnapshotBuilder
	| artifact |
	artifact := (self liveArtifactFor: anObject at: path) capture.
	aSnapshotBuilder add: artifact.