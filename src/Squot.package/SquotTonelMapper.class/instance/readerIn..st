changes-operations
readerIn: aFilesystem
	^ TonelReader
		on: (aFilesystem referenceTo: self path)
		fileName: self package name