verifying
verifyIndexHeader
	| identifier version entryCount |
	identifier := indexReader next: 4.
	self assert:  identifier asString = 'DIRC'.
	version := indexReader next: 4.
	self assert: version asInteger = 2.
	entryCount := indexReader next: 4.
	self assert: entryCount asInteger = 161