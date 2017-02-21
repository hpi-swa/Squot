helpers-testing
hasBlobSignature
	^ (packReader peek bitAnd: 2r0111000) = 2r00110000