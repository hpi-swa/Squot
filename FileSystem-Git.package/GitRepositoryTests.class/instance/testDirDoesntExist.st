tests
testDirDoesntExist
	repository := GitRepository basicNew.
	repository instVarNamed: 'reference' put: (reference resolve: 'newRepo').
	self deny: repository exists.
	repository gitInitialize.
	self assert: repository exists