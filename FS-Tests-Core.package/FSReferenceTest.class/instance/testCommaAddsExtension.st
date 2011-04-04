tests
testCommaAddsExtension
	| ref result |
	ref := filesystem referenceTo: 'plonk'.
	result := ref, 'griffle'.
	self assert: result basename = 'plonk.griffle'