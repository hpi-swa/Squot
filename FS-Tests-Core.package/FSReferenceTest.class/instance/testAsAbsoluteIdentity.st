tests
testAsAbsoluteIdentity
	| ref |
	ref := filesystem referenceTo: '/plonk'.
	self assert: ref asAbsolute == ref