private
streamLooseObjectNamed: aHexHash ifAbsent: aBlock
	^ (repository baseDir resolve: (self looseObjectPathFor: aHexHash)) 
		readStreamDo: [ :stream | (GitZLibReadStream on: stream binary contents) contents readStream ]
		ifAbsent: aBlock