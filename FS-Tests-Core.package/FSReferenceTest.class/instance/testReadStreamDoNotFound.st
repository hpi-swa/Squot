tests stream
testReadStreamDoNotFound
	| ref path |
	path := FSPath * 'plonk'.
	ref := filesystem referenceTo: path.
	self
		should: [ref readStreamDo: [:s]]
		raise: FSFileDoesNotExist 