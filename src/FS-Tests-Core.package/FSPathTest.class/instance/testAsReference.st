tests
testAsReference
	| path reference |
	path := Path * 'plonk'.
	reference := path asReference.
	self assert: reference class = FSReference.
	self assert: reference path = path