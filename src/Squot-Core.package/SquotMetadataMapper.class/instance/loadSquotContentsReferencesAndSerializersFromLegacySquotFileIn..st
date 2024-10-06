metadata-loading-legacy
loadSquotContentsReferencesAndSerializersFromLegacySquotFileIn: aFileSystem
	| reference loadOrder |
	reference := self legacySquotFileReferenceIn: aFileSystem.
	reference exists ifFalse: [^ nil].
	loadOrder := reference readStreamDo: [:stream | STON fromStream: stream].
	^ loadOrder associations collect: [:pathToSerializer | | path |
		path := (SquotPathUtilities fromString: pathToSerializer key) / self legacySquotContentsFileBaseName.
		(aFileSystem referenceTo: path) -> pathToSerializer value]