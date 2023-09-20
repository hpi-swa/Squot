operations
serializeInto: aFileSystem
	(aFileSystem referenceTo: self path) writeStreamDo: [:stream |
		self mapper writeVersion: self versionToWrite on: stream].