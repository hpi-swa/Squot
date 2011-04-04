compatibility tests
testCommaAddsExtensionAgain
	locator := FSLocator image / 'griffle.plonk'.
	self assert: (locator , 'nurp') basename = 'griffle.plonk.nurp'