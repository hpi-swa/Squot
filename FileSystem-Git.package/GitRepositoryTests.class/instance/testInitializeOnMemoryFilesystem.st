tests
testInitializeOnMemoryFilesystem
	reference := FileSystem memory / 'newRepo'.
	repository := GitRepository basicNew initializeOn: reference.
	self assert: (repository baseDir fileSystem isKindOf: FileSystem).
	self assert: repository baseDir = (reference / '.git')