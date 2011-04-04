tests
testAsReference
	| ref |
	ref := filesystem referenceTo: 'plonk'.
	self assert: ref asReference == ref