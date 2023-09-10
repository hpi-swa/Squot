operations
serializeInto: aFileSystem
	(aFileSystem referenceTo: self path) writeStreamDo: [:stream |
		self writerClass putForm: self formToWrite onStream: stream].