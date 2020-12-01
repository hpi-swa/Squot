commit tests
testAddFilesAndDirectoriesDeepInTrees
	| intermediatePath |
	self assert: workingCopy root children isEmpty.
	intermediatePath := FSPath / 'foo'.
	((workingCopy root resolve: intermediatePath / 'bar' / 'bla') ensureDirectory; yourself)
		/ 'file1' writeStreamDo: [:stream | stream nextPutAll: 'file1'].
	self commit: 'first commit'.
	self withUnitOfWork: [:git |
	self assert: (fsRepository head referenceTo: intermediatePath / 'bar' / 'bla') isDirectory;
		assert: (fsRepository head referenceTo: intermediatePath / 'bar' / 'bla' / 'file1') isFile.

	((workingCopy root resolve: intermediatePath / 'blub') ensureDirectory; yourself) / 'file2'
		writeStreamDo: [:stream | stream nextPutAll: 'file2'].
	self commit: 'second commit'.
	self assert: (fsRepository head referenceTo: intermediatePath / 'blub' / 'file2') isFile.
	].