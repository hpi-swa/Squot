tests
testEqual

	| a b |
	a := filesystem referenceTo: 'plonk'.
	b := filesystem referenceTo: 'plonk'.
	self deny: a == b.
	self assert: a = b.