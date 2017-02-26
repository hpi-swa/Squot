tests
testSlash
	| path actual |
	path := FSPath * 'plonk'.
	actual := path / 'griffle'.
	self assert: actual class = path class.
	self assert: (actual printWithDelimiter: $/)  = 'plonk/griffle'