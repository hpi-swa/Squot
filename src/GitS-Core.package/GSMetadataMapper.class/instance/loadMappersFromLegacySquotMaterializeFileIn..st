metadata-loading-legacy
loadMappersFromLegacySquotMaterializeFileIn: aFileSystem
	| reference |
	reference := self legacySquotMaterializeReferenceIn: aFileSystem.
	reference exists ifFalse: [^ nil].
	^ reference readStreamDo: [:stream | self stonFromStream: stream]