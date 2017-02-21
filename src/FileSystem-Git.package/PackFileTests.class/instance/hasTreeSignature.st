helpers-testing
hasTreeSignature
	^ (packReader peek bitAnd: 2r01110000) = 2r00100000