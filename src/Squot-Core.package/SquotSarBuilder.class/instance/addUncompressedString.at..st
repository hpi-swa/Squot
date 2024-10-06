adding
addUncompressedString: aStringOrByteArray at: aString
	^ (self addString: aStringOrByteArray at: aString)
		desiredCompressionLevel: 0;
		yourself