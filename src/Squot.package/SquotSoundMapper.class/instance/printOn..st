printing
printOn: aStream
	super printOn: aStream.
	aStream
		nextPutAll: ' encoded using ';
		nextPutAll: self encoding.