tests
testEqual
	| a b |
	a := FSPath * 'plonk'.
	b := FSPath * 'plonk'.
	self deny: a == b.
	self assert: a = b.