tests
testCommaAddsExtensionAgain
	| ref result |
	ref := filesystem referenceTo: 'plonk.griffle'.
	result := ref, 'nurp'.
	self assert: result basename = 'plonk.griffle.nurp'