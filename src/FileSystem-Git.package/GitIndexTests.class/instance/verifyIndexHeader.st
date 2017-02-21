verifying
verifyIndexHeader
	"see 'index-format.txt' in the docs"
	| identifier version entryCount |
	identifier := indexReader next: 4.
	self assert:  identifier asString equals: 'DIRC'.
	version := indexReader next: 4.
	self assert: version asInteger equals: 2.
	entryCount := indexReader next: 4.
	self assert: entryCount asInteger equals: 1