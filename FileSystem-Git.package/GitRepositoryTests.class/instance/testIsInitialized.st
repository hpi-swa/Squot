tests
testIsInitialized
	repository := GitRepository basicNew.
	repository instVarNamed: 'reference' put: (FSFilesystem memory / 'test.git').
	self deny: repository isInitialized.
	
	repository gitInitialize.
	self assert: repository isInitialized