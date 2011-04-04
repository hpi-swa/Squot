tests
testWithExtentionReplacesExtension
	| ref result |
	ref := filesystem referenceTo: 'plonk.griffle'.
	result := ref withExtension: 'nurp'.
	self assert: result isRelative.
	self assert: result basename = 'plonk.nurp'