metadata-loading
loadFallbackMappersFromFileSystem: aFileSystem
	^ (self loadMappersFromLegacyMappersFileIn: aFileSystem)
		ifNil: [(self loadMappersFromLegacySquotFileIn: aFileSystem)
				ifNil: [OrderedCollection new]]