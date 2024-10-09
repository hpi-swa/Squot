metadata-loading
loadMetadataFileFromFileSystem: aFileSystem
	| reference |
	reference := {self metadataReferenceIn: aFileSystem. self legacySquotMetadataReferenceIn: aFileSystem}
					detect: #exists ifNone: [^ nil].
	^ reference readStreamDo: [:stream | self stonFromStream: stream]