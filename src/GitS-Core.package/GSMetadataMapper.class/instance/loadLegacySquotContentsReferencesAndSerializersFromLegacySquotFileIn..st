metadata-loading-legacy
loadLegacySquotContentsReferencesAndSerializersFromLegacySquotFileIn: aFileSystem
	| reference loadOrder |
	reference := self legacySquotReferenceIn: aFileSystem.
	reference isFile ifFalse: [^ nil].
	loadOrder := reference readStreamDo: [:stream | self stonFromStream: stream].
	^ loadOrder associations collect: [:pathToSerializer | | path |
		path := (GSPathUtilities fromString: pathToSerializer key) / self legacySquotContentsFileBaseName.
		(aFileSystem referenceTo: path) -> pathToSerializer value]