tests
testAbsolutePrintString
	| path actual |
	path := Path / 'plonk' / 'griffle'.
	actual := path printString.
	self assert: actual = 'FSPath / ''plonk'' / ''griffle'''