tests
testContainsLocator
	| ancestor descendent |
	ancestor := FSLocator imageDirectory resolve path.
	descendent := FSLocator image / 'griffle'.
	self deny: (ancestor contains: descendent).
	self deny: (descendent contains: ancestor)