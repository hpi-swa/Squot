filesystem
legacyReferencesIn: aFileSystem
	^ (self fixedLegacyReferencesIn: aFileSystem), (self loadLegacySquotContentsReferencesIn: aFileSystem)