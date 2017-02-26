compatibility tests
testAsAbsolute
	locator := FSLocator image.
	self assert: locator asAbsolute = locator