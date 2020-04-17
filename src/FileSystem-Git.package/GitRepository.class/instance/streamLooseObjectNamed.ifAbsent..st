accessing-objects
streamLooseObjectNamed: aHexHash ifAbsent: aBlock
	self privateDeprecatedUseUnitOfWork.
	^ (self baseDir resolve: (self looseObjectPathFor: aHexHash)) 
		readStreamDo: [ :stream | (GitZLibReadStream on: stream binary contents) contents readStream ]
		ifAbsent: aBlock