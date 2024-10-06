metadata-loading-legacy
loadLegacySquotContentsFileReferencesIn: aFileSystem
	^ ((self loadSquotContentsReferencesAndSerializersFromLegacySquotFileIn: aFileSystem)
		ifNil: [^ {}]) collect: #key