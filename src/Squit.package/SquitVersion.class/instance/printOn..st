printing
printOn: aStream
	aStream
		nextPutAll: 'commit ';
		nextPutAll: self shortId;
		space;
		nextPut: $";
		nextPutAll: self message;
		nextPut: $".