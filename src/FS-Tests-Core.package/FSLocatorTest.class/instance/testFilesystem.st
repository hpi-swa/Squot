compatibility tests
testFilesystem
	locator := FSLocator image.
	self assert: (locator filesystem isKindOf: FSFilesystem)