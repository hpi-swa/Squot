compatibility tests
testCommaAddsExtension
	locator := FSLocator image / 'griffle'.
	self assert: (locator , 'plonk') basename = 'griffle.plonk'