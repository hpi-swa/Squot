helpers-testing
hasCommitSignature
	^ (packReader peek bitAnd: 2r01110000) = 2r00010000