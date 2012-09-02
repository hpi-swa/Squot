helpers
hexHashFor: anInteger
	^ (anInteger printStringBase: 16 length: 40 padded: true) asLowercase