accessing-objects
streamLooseObjectNamed: aHexHash ifAbsent: aBlock
	^ (self baseDir resolve: (self looseObjectPathFor: aHexHash)) 
		readStreamDo: [ :stream | ReadStream on: (ZLibReadStream on: stream binary contents) contents ]
		ifAbsent: aBlock