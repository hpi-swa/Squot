printing
printEncodedUsingOn: aStream
	aStream
		nextPutAll: ' encoded using ';
		nextPutAll: self encodingName.