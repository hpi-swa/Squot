compatibility tests
testContainsPath
	"self debug: #testContainsPath"
	
	locator := FSLocator image.
	self assert: (locator contains: (locator resolve / 'griffle') path).