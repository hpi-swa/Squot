metadata-loading
loadFallbackMappersFromFileSystem: aFileSystem
	^ (self loadMappersFromLegacySquotMaterializeFileIn: aFileSystem)
		ifNil: [(self loadMappersFromLegacySquotFileIn: aFileSystem)
				ifNil: [OrderedCollection new]]