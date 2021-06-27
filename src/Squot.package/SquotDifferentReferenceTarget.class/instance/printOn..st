printing
printOn: aStream
	aStream
		nextPutAll: 'modified ';
		print: reference.