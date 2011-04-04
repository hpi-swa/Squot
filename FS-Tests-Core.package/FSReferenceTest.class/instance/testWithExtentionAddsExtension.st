tests
testWithExtentionAddsExtension
	| ref result |
	ref := filesystem referenceTo: 'plonk'.
	result := ref withExtension: 'griffle'.
	self assert: result isRelative.
	self assert: result basename = 'plonk.griffle'