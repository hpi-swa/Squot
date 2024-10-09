accessing
mappedPathPatterns
	^ {
		GSPathPattern exactMatch: self metadataFilePath.
		GSPathPattern exactMatch: self legacySquotMetadataFilePath.
		GSPathPattern exactMatch: self legacySquotMaterializeFilePath.
		GSPathPattern exactMatch: self legacySquotFilePath.
		GSPathPattern endsWith: {self legacySquotContentsFileBaseName}.
	}