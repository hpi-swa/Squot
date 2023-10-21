printing
printAtPathOn: aStream
	aStream
		nextPutAll: ' at ';
		nextPutAll: (SquotPathUtilities asString: self path).