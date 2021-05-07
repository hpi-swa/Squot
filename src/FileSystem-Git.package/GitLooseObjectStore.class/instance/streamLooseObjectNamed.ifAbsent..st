private
streamLooseObjectNamed: aHexHash ifAbsent: aBlock
	^ (baseDir resolve: (self looseObjectPathFor: aHexHash)) 
		readStreamDo: [ :stream | (GitZLibReadStream on: stream binary contents) contents readStream ]
		ifAbsent: aBlock