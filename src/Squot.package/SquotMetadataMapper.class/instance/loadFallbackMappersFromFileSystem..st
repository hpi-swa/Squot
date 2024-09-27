metadata-loading
loadFallbackMappersFromFileSystem: aFileSystem
	^ (self loadLegacyMappersFromFileSystem: aFileSystem) ifNil: [OrderedCollection new]