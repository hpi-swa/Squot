tests
testCommaAddsExtensionAgain
	| path result |
	path := FSPath * 'plonk.griffle'.
	result := path, 'nurp'.
	self assert: result basename = 'plonk.griffle.nurp'