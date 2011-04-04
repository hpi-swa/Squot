tests
testSiblingOfReference
	| griffle  nurb |
	griffle := filesystem referenceTo: '/griffle'.
	nurb := filesystem referenceTo: '/nurb'.
	self deny: (griffle isChildOf: nurb).
	self deny: (nurb isChildOf: griffle).