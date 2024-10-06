metadata-loading-legacy
loadMappersFromLegacyMappersFileIn: aFileSystem
	| reference |
	reference := self legacyMappersFileReferenceIn: aFileSystem.
	reference exists ifFalse: [^ nil].
	^ reference readStreamDo: [:stream | STON fromStream: stream]