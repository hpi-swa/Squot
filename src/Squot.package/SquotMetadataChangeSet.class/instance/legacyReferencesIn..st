operations
legacyReferencesIn: aFileSystem
	^ {self legacyMappersFileReferenceIn: aFileSystem. self legacySquotFileReferenceIn: aFileSystem},
		(self loadLegacySquotContentsFileReferencesIn: aFileSystem)