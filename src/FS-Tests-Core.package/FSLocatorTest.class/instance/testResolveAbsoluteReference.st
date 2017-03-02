resolution tests
testResolveAbsoluteReference
	| result reference |
	locator := FSLocator image / 'plonk'.
	reference := FileSystem memory / 'griffle'.
	result := locator resolve: reference..
	self assert: result == reference