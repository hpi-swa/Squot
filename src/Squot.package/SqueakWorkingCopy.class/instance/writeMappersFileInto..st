mappers
writeMappersFileInto: aFileSystem
	(self mappersFileReferenceIn: aFileSystem) writeStreamDo: [:stream |
		STON put: self mappersFileContents onStream: stream].