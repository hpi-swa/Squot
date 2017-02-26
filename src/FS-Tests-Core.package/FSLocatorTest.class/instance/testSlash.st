compatibility tests
testSlash
	locator := FSLocator image / 'griffle'.
	self assert: locator = (FSLocator image / 'griffle')