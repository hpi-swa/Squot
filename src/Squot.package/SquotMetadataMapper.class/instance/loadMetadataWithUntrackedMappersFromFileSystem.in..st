metadata-loading
loadMetadataWithUntrackedMappersFromFileSystem: aFileSystem in: aWorkingCopy
	^ (self loadMetadataFromFileSystem: aFileSystem in: aWorkingCopy) withUntrackedMappersIn: aFileSystem