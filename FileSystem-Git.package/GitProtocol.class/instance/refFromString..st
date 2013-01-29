accessing
refFromString: aString
	| lineLength |
	lineLength := (Integer readFrom: (aString first: 4) base: 16) - 1.
	self assert: aString size = lineLength.
	^ aString last: lineLength - 4