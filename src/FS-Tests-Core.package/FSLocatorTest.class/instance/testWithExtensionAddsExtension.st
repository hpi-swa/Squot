compatibility tests
testWithExtensionAddsExtension
	locator := FSLocator image / 'griffle'.
	self assert: (locator withExtension: 'plonk') basename = 'griffle.plonk'