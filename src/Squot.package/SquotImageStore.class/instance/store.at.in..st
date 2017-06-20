private snapshot building
store: anObject at: path in: aSnapshotBuilder
	| artifact metadata |
	artifact := SquotArtifact new
		content: anObject captureWithSquot;
		path: path;
		yourself.
	metadata := (additionalInfo at: path) copy.
	anObject squotRemoveTransientStoreInfoFrom: metadata.
	artifact storeInfo: metadata.
	aSnapshotBuilder add: artifact.