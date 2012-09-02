tests
testInitializeOnDiskFilesystem
	reference := FileSystem disk workingDirectory / 'newRepo'.
	repository := GitRepository basicNew initializeOn: reference.
	self assert: (repository baseDir fileSystem isKindOf: FileSystem).
	self assert: repository baseDir = (reference / '.git').
	reference deleteAll.
	self deny: reference exists