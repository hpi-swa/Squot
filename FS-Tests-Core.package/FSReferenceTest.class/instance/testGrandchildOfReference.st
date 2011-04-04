tests
testGrandchildOfReference
	| griffle  nurb |
	griffle := filesystem referenceTo: '/griffle'.
	nurb := filesystem referenceTo: '/griffle/plonk/nurb'.
	self deny: (griffle isChildOf: nurb).
	self deny: (nurb isChildOf: griffle).