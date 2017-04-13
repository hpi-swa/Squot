accessing - multibyte support
basicNext
	| result |
	result := handle at: position + 1.
	position := position + 1.
	isBinary ifFalse: [result := result asCharacter].
 	^ result