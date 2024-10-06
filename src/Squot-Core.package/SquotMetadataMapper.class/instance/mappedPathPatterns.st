accessing
mappedPathPatterns
	^ {
		SquotPathPattern exactMatch: self metadataFilePath.
		SquotPathPattern exactMatch: self legacyMappersFilePath.
		SquotPathPattern exactMatch: self legacySquotFilePath.
		SquotPathPattern endsWith: {self legacySquotContentsFileBaseName}.
	}