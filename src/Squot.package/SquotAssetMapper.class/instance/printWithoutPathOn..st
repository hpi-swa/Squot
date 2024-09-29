printing
printWithoutPathOn: aStream
	self
		printKindOn: aStream;
		space: aStream;
		printEncodedUsingOn: aStream.