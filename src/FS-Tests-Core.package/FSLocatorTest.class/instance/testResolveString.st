resolution tests
testResolveString
	| result path |
	locator := FSLocator image / 'plonk'.
	result := locator resolve: 'griffle'.
	path := (Path * 'plonk') / 'griffle'.
	self assert: result class= locator class.
	self assert: result origin = locator origin.
	self assert: result path = path.