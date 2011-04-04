tests
testReadStreamNotFound
	| ref path |
	path := FSPath * 'plonk'.
	ref := filesystem referenceTo: path.
	self
		should: [ref readStream]
		raise: FSFileDoesNotExist 