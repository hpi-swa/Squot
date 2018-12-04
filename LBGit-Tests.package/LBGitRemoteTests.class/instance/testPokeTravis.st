tests
testPokeTravis

	self createDummyFile.
	self assert: (self reference resolve: self dummyFile) exists.
	self commit: 'TestXY'.
	self assert: (self gitReference resolve: self dummyFile) exists.
	self assert: 'TestXY' equals: self workingCopy loadedVersion commit message.