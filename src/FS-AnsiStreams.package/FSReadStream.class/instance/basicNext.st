accessing - multibyte support
basicNext
	| result |
	result := handle at: position.
	position := position + 1.
 	^ result