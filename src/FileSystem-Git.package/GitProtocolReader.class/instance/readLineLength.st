private receiving
readLineLength
	| lineLength |
	lineLength := Integer readFrom: self fourByteLookahead asString base: 16.
	self resetFourByteLookahead.
	^ lineLength