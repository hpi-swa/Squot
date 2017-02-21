private snapshot building
store: anObject at: path in: aSnapshotBuilder
	| artifact |
	artifact := SquotArtifact new
		content: anObject asSquotContent;
		path: path;
		storeInfo: (additionalInfo at: path);
		yourself.
	aSnapshotBuilder add: artifact.