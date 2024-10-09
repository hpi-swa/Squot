asset-creation
loadAssetFileFrom: aFileSystem
	| reference |
	reference := aFileSystem referenceTo: self path.
	reference isFile ifFalse: [^ nil].
	^ reference readStreamDo: [:stream |
		(self canReadAssetFrom: stream) ifFalse: [^ nil].
		GSAssetFile withMapper: self fromStream: stream]