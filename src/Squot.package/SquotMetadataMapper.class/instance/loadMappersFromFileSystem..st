metadata-loading
loadMappersFromFileSystem: aFileSystem
	^ (self loadMetadataFileFromFileSystem: aFileSystem)
		ifNotNil: [:metadata | metadata mappers]
		ifNil: [self loadFallbackMappersFromFileSystem: aFileSystem]