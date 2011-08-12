tests
testAsReference
	| ref |
	ref := filesystem * 'plonk'.
	self assert: ref asReference == ref