Squot deserialization
initializeCypressReaderToReadClassFrom: aDirectory
	| packageDirectory |
	cypressReader := MCFileTreeStCypressReaderWithSettableFileUtils on: aDirectory.
	cypressReader fileUtils: fileUtils.
	fileUtils directory: aDirectory.
	packageDirectory := aDirectory parent.
	cypressReader packageDirectory: packageDirectory pathString.