operations
serializeInto: aFileSystem
	| reference version |
	reference := aFileSystem referenceTo: self path.
	version := self versionToWrite.
	version ifNil: [^ reference delete].
	reference writeStreamDo: [:stream |
		self mapper writeVersion: self versionToWrite on: stream].