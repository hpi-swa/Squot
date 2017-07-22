private snapshot building
store: anObject at: path in: aSnapshotBuilder
	| artifact |
	artifact := (self liveObjectFor: anObject at: path) capture.
	aSnapshotBuilder add: artifact.