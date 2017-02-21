tests
testBytePadding
	| testHash |
	testHash := '00a350a77157772e1e35bb27b0582a8c51094fac'.
	self deny: (testHash asByteHash asHexHash beginsWith: 'a35')