testing
hasAnyFile: aFileSystem
	^ (self fixedLegacyReferencesIn: aFileSystem) anySatisfy: #isFile