metadata-loading-legacy
loadMappersFromLegacySquotFileIn: aFileSystem
	^ ((self loadSquotContentsReferencesAndSerializersFromLegacySquotFileIn: aFileSystem)
		ifNil: [^ nil])
			collect: [:referenceToSerializer |
				self
					loadMapperFromLegacySquotContentsReference: referenceToSerializer key
					fallbackSerializer: referenceToSerializer value]
			thenSelect: #notNil