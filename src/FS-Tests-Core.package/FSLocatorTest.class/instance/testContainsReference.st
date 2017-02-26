compatibility tests
testContainsReference
	locator := FSLocator image.
	self assert: (locator contains: (locator resolve / 'griffle')).