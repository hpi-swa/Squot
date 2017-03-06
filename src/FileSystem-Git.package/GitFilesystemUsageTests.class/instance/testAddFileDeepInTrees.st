commit tests
testAddFileDeepInTrees
	| deepDirectoryPath deepDirectory |
	self assert: workingCopy root children isEmpty.
	deepDirectoryPath := FSPath / 'foo' / 'bar' / 'bla'.
	(deepDirectory := workingCopy root resolve: deepDirectoryPath) ensureDirectory.
	deepDirectory / 'file1' writeStreamDo: [:stream | stream nextPutAll: 'file1'].
	workingCopy commit: 'first commit'.
	self assert: (fsRepository head referenceTo: deepDirectoryPath) isDirectory;
		assert: (fsRepository head referenceTo: deepDirectoryPath / 'file1') isFile.

	deepDirectory / 'file2' writeStreamDo: [:stream | stream nextPutAll: 'file2'].
	workingCopy commit: 'second commit'.
	self assert: (fsRepository head referenceTo: deepDirectoryPath / 'file2') isFile.