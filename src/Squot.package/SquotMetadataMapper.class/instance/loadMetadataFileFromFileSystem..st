metadata-loading
loadMetadataFileFromFileSystem: aFileSystem
	| reference |
	reference := self metadataFileReferenceIn: aFileSystem.
	reference exists ifFalse: [^ nil].
	^ reference readStreamDo: [:stream | STON fromStream: stream]