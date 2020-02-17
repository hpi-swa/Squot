tests
testIsInitialized
	repository := GitRepository basicNew.
	repository instVarNamed: 'reference' put: (FileSystem memory / 'test.git').
	self deny: repository isInitialized.
	
	repository gitInitialize.
	self assert: repository isInitialized