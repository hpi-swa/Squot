tests
testAsHexHash
	| testHash |
	testHash := '00a350a77157772e1e35bb27b0582a8c51094fac'.
	self assert: (testHash asHexHash isKindOf: String).
	self assert: testHash size = 40.
	self assert: testHash asHexHash size = testHash size.
	self assert: testHash asByteHash asHexHash = testHash.
	self assert: testHash asByteHash asHexHash asHexHash = testHash