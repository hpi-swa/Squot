tests
testDirExistsButNotInitialized
	reference := reference resolve: 'newRepo'.
	repository := GitRepository basicNew.
	repository instVarNamed: 'reference' put: reference.
	reference createDirectory.
	self deny: repository exists.
	repository gitInitialize.
	self assert: repository exists