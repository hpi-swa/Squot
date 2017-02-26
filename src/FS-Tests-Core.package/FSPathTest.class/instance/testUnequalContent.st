tests
testUnequalContent
	| a b |
	a := FSPath * 'plonk'.
	b := FSPath * 'griffle'.
	self deny: a = b.