operations
serializeInto: aFileSystem
	| reference assetFile |
	self isExcluded ifTrue: [^ self].
	reference := aFileSystem referenceTo: self path.
	assetFile := self assetFileToWrite.
	assetFile ifNil: [^ reference delete].
	reference writeStreamDo: [:stream | stream nextPutAll: assetFile contents].