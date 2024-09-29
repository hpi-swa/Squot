printing
printOn: aStream
	self
		printKindOn: aStream;
		space: aStream;
		printAtPathOn: aStream;
		space: aStream;
		printEncodedUsingOn: aStream.