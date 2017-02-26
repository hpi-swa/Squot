tests
testCommaAddsExtension
	| path result |
	path := FSPath * 'plonk' .
	result := path, 'griffle'.
	self assert: result basename = 'plonk.griffle'