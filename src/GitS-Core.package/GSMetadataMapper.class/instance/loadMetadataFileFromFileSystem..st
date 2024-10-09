metadata-loading
loadMetadataFileFromFileSystem: aFileSystem
	| reference |
	reference := {self metadataReferenceIn: aFileSystem. self legacySquotMetadataReferenceIn: aFileSystem}
					detect: #isFile ifNone: [^ nil].
	^ reference readStreamDo: [:stream | self stonFromStream: stream]