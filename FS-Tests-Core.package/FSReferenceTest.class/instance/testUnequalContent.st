tests
testUnequalContent
	| a b |
	a := filesystem referenceTo: 'plonk'.
	b := filesystem referenceTo: 'griffle'.
	self deny: a = b.