metadata-loading
loadFallbackMetadataFromFileSystem: aFileSystem in: aWorkingCopy
	^ (self loadMetadataFromWorkingCopy: aWorkingCopy)
		mappers: (self loadFallbackMappersFromFileSystem: aFileSystem);
		setLegacyVersion;
		yourself