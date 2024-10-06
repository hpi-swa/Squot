testing
hasAnyFile: aFileSystem
	^ (self hasMetadataFile: aFileSystem)
		or: [self hasLegacyMappersFile: aFileSystem]
		or: [self hasLegacySquotFile: aFileSystem]