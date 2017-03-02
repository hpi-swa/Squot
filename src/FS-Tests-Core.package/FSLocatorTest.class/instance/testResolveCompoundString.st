resolution tests
testResolveCompoundString
	| result compound |
	locator := FSLocator image / 'plonk'.
	compound := 'griffle', locator filesystem delimiter asString, 'nurp'.
	result := locator resolve: compound.
	self assert: result class = locator class.
	self assert: result origin = locator origin.
	self assert: result path = ((Path * 'plonk') / 'griffle' / 'nurp')