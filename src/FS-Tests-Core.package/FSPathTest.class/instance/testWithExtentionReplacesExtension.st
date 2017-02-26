tests
testWithExtentionReplacesExtension
	| path result |
	path := FSPath * 'plonk.griffle'.
	result := path withExtension: 'griffle'.
	self assert: result basename = 'plonk.griffle'