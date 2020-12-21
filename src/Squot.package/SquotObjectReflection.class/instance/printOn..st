printing
printOn: aStream
	aStream
		nextPutAll: 'reflected ';
		print: object;
		nextPutAll: ' in ';
		print: mirror.