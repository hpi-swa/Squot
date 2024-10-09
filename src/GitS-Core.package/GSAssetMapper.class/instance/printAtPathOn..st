printing
printAtPathOn: aStream
	aStream
		nextPutAll: 'at ';
		nextPutAll: (GSPathUtilities asString: self path).