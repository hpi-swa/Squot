asset-creation
loadAssetFileFrom: aFileSystem
	| reference |
	reference := aFileSystem referenceTo: self path.
	reference exists ifFalse: [^ nil].
	^ reference readStreamDo: [:stream |
		(self canReadAssetFrom: stream) ifFalse: [^ nil].
		GSAssetFile withMapper: self fromStream: stream]