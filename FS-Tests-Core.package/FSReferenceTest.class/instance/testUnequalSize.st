tests
testUnequalSize
	| a b |
	a := filesystem referenceTo: 'plonk'.
	b := filesystem referenceTo: 'plonk/griffle'.
	self deny: a = b.