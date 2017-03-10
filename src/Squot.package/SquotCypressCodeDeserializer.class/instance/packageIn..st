Squot deserialization
packageIn: aDirectory
	| cypressReader |
	cypressReader := MCFileTreeStCypressReaderWithSettableFileUtils on: aDirectory.
	cypressReader fileUtils: fileUtils.
	cypressReader packageDirectory: aDirectory pathString.
	fileUtils directory: aDirectory.
	^ cypressReader package packageInfo