printing
makeTwoDigitString: anInteger
	^ anInteger asString padded: #left to: 2 with: $0