tests
testInitializeOnDiskFilesystem
	reference := FSFilesystem disk workingDirectory / 'newRepo'.
	repository := GitRepository basicNew initializeOn: reference.
	self assert: (repository baseDir filesystem isKindOf: FSFilesystem).
	self assert: repository baseDir = (reference / '.git').
	reference deleteAll.
	self deny: reference exists