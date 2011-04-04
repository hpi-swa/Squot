resolution tests
testResolveAbsoluteReference
	| result reference |
	locator := FSLocator image / 'plonk'.
	reference := FSFilesystem inMemory root / 'griffle'.
	result := locator resolve: reference..
	self assert: result == reference