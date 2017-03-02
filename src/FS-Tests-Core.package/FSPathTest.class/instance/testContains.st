tests
testContains
	| ancestor descendent |
	ancestor := FSPath / 'plonk'.
	descendent := FSPath / 'plonk' / 'griffle' / 'bork'.
	self assert: (ancestor contains: descendent).
	self deny: (descendent contains: ancestor)