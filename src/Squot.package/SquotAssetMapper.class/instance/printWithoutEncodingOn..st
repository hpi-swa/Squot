printing
printWithoutEncodingOn: aStream
	self
		printKindOn: aStream;
		space: aStream;
		printAtPathOn: aStream.