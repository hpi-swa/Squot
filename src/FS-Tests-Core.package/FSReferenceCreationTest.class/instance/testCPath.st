tests
testCPath
	| ref |
	ref := FSReference C / 'WINDOWS'.
	self assert: (ref filesystem isKindOf: FileSystem).
	self assert: ref path = (FSPath / 'C:' / 'WINDOWS')