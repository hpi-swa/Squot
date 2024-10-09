metadata-loading-legacy
loadLegacySquotContentsReferencesIn: aFileSystem
	^ ((self loadLegacySquotContentsReferencesAndSerializersFromLegacySquotFileIn: aFileSystem)
		ifNil: [^ {}]) collect: #key