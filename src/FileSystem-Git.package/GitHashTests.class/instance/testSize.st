tests
testSize
	| testHash |
	testHash := '00a350a77157772e1e35bb27b0582a8c51094fac'.
	self assert: testHash size = 40.
	self assert: testHash asByteHash size = 20.
	self assert: testHash asByteHash asHexHash size = 40