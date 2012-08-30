operations-writing
writePackFileTrailer
	| checksum size reader |
	reader := self packFile readStream.
	checksum := [ SecureHashAlgorithm new hashStream: reader ]
		ensure: [ reader close ].
	size := self packFile reference entry size.
	self packFile reference writeStreamDo: [ :stream |
		stream position: size + 1.
		stream nextPutAll: checksum asByteArray ]