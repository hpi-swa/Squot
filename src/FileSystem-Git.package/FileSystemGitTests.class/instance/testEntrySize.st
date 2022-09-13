tests
testEntrySize
	| theFile theDirectory rootEntries directoryEntries |
	(theDirectory := filesystem / 'foobar') ensureDirectory.
	(theFile := theDirectory / 'bla') ensureFile.
	theFile writeStreamDo: [:stream | stream nextPutAll: 'foobar'].
	self delete: theDirectory;
		delete: theFile.
	repository withUnitOfWork: [filesystem commit: 'Create file and directory'].
	"when"
	repository withUnitOfWork:
		[rootEntries := filesystem root entries.
		directoryEntries := theDirectory entries].
	"then"
	self assert: rootEntries first size = 0;
		assert: directoryEntries first size = 6.