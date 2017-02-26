tests
testWithExtentionAddsExtension
	| path result |
	path := FSPath * 'plonk'.
	result := path withExtension: 'griffle'.
	self assert: result basename = 'plonk.griffle'