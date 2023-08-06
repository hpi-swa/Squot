update migration
findStoreForOldArtifactWithoutReferences: aTrackedObjectMetadata
	^ SquotFileSystemObjectStore detectImplementation: [:each | each canStoreOldArtifactWithoutReferences: aTrackedObjectMetadata]
		ifNone: [self error: 'Don''t know how to read artifact at ', (aTrackedObjectMetadata at: #path)]