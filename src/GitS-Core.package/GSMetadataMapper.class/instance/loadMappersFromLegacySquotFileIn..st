metadata-loading-legacy
loadMappersFromLegacySquotFileIn: aFileSystem
	^ ((self loadLegacySquotContentsReferencesAndSerializersFromLegacySquotFileIn: aFileSystem)
		ifNil: [^ nil])
			collect: [:referenceToSerializer |
				self
					loadMapperFromLegacySquotContentsReference: referenceToSerializer key
					fallbackSerializer: referenceToSerializer value]
			thenSelect: #notNil