tests
testAsByteHash
	| testHash |
	testHash := '00a350a77157772e1e35bb27b0582a8c51094fac'.
	self assert: (testHash asByteHash isKindOf: ByteArray).
	self assert: testHash asByteHash size = 20.
	self assert: testHash asByteHash = #[0 163 80 167 113 87 119 46 30 53 187 39 176 88 42 140 81 9 79 172].
	self assert: testHash asByteHash = testHash asByteHash asByteHash