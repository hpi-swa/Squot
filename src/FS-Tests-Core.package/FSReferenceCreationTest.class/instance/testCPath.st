tests
testCPath
	| ref |
	ref := FSReference C / 'WINDOWS'.
	self assert: (ref filesystem isKindOf: FileSystem).
	self assert: ref path = (Path / 'C:' / 'WINDOWS')