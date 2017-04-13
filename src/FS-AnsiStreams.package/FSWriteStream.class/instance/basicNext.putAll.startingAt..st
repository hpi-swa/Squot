writing - multibyte support
basicNext: anInteger putAll: aCollection startingAt: startIndex
	handle at: position + 1 write: aCollection startingAt: startIndex count: anInteger.
	position := position + anInteger.
	^ aCollection