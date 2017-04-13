writing - multibyte support
basicNextPut: anObject
	handle at: position + 1 put: anObject.
	position := position + 1.
	^ anObject