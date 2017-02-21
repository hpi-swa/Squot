helpers-testing
hasOfsDeltaSignature 
	^ (packReader peek bitAnd: 2r01110000) = 2r01100000