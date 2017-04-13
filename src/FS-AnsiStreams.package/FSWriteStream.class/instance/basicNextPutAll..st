writing - multibyte support
basicNextPutAll: aCollection
	handle at: position + 1 write: aCollection startingAt: 1 count: aCollection size.
	position := position + aCollection size.
	^ aCollection