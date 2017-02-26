compatibility tests
testIsRoot
	locator := FSLocator image.
	(locator resolve path size) timesRepeat: [locator := locator / '..'].
	self assert: locator isRoot