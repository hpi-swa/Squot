operations
serializeInto: aFileSystem
	| reference version |
	self isExcluded ifTrue: [^ self].
	reference := aFileSystem referenceTo: self path.
	version := self versionToWrite.
	version ifNil: [^ reference delete].
	reference writeStreamDo: [:stream |
		self mapper writeVersion: version on: stream].