changes-operations
serializeChanges: aCollection into: aFileSystem
	aCollection size = 1 ifFalse: [self error: 'attempting to serialize multiple image changes at once'].
	(aFileSystem referenceTo: self path) writeStreamDo: [:stream | self writerClass putForm: aCollection first value onStream: stream].