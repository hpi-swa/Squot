filesystem
fixedLegacyReferencesIn: aFileSystem
	^ {
		self legacySquotMetadataReferenceIn: aFileSystem.
		self legacySquotMaterializeReferenceIn: aFileSystem.
		self legacySquotReferenceIn: aFileSystem.
	}