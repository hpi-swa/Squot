tests
testAsReference
	| path reference |
	path := FSPath * 'plonk'.
	reference := path asReference.
	self assert: reference class = FSReference.
	self assert: reference path = path