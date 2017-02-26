tests
testCPath
	| ref |
	ref := FSReference C / 'WINDOWS'.
	self assert: (ref filesystem isKindOf: FSFilesystem).
	self assert: ref path = (FSPath / 'C:' / 'WINDOWS')