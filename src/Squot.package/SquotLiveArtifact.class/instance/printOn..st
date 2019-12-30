printing
printOn: aStream
	aStream print: path;
		nextPutAll: ' in ';
		print: store.