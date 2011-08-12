resolution tests
testResolveRelativeReference
	| result reference |
	locator := FSLocator image / 'plonk'.
	self flag: 'this is a bit weird...'.
	reference := FSFilesystem memory referenceTo: 'griffle'.
	result := locator resolve: reference..
	self assert: result class= locator class.
	self assert: result origin = locator origin.
	self assert: result path = reference path.