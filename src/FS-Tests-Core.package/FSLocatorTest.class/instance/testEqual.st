compatibility tests
testEqual
	| a b |
	a := FSLocator image.
	b := FSLocator image.
	self deny: a == b.
	self assert: a = b.