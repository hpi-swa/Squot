private
createLazyArtifactForObjectAt: aFSReference
	| artifact |
	artifact := SquotLazyArtifact new
		path: (self pathOf: aFSReference);
		yourself.
	^ artifact
		onLoadContent: [self readContent: artifact];
		onLoadStoreInfo: [self readMetadata: artifact];
		yourself