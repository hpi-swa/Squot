metadata-loading-legacy
loadMappersFromLegacySquotMaterializeFileIn: aFileSystem
	| reference |
	reference := self legacySquotMaterializeReferenceIn: aFileSystem.
	reference isFile ifFalse: [^ nil].
	^ reference readStreamDo: [:stream | self stonFromStream: stream]