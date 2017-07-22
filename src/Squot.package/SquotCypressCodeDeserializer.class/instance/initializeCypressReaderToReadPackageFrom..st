Squot deserialization
initializeCypressReaderToReadPackageFrom: aDirectory
	cypressReader := MCFileTreeStCypressReaderWithSettableFileUtils on: aDirectory.
	cypressReader fileUtils: fileUtils.
	fileUtils directory: aDirectory.
	cypressReader packageDirectory: aDirectory pathString.