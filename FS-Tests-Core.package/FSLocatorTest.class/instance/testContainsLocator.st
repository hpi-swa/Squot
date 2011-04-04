compatibility tests
testContainsLocator
	locator := FSLocator image.
	self assert: (locator contains: locator / 'griffle').