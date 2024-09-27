testing
hasAnyFile: aFileSystem
	^ (self hasMetadataFile: aFileSystem) or: [self hasLegacyMappersFile: aFileSystem]