tests
testUnequalSize
	| a b |
	a := FSPath * 'plonk'.
	b := (FSPath * 'plonk') / 'griffle'.
	self deny: a = b.