resolution tests
testResolveAbsoluteReference
	| result reference |
	locator := FSLocator image / 'plonk'.
	reference := FSFilesystem memory / 'griffle'.
	result := locator resolve: reference..
	self assert: result == reference