metadata-loading
loadMetadataFromFileSystem: aFileSystem in: aWorkingCopy
	^ (self loadMetadataFileFromFileSystem: aFileSystem)
		ifNil: [self loadFallbackMetadataFromFileSystem: aFileSystem in: aWorkingCopy]