compatibility tests
testWithExtensionReplacesExtension
	locator := FSLocator image / 'griffle.nurp'.
	self assert: (locator withExtension: 'plonk') basename = 'griffle.plonk'