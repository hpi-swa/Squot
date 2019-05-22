printing
printOn: aStream
	aStream
		nextPutAll: self class name asString;
		space;
		print: self internalId;
		space;
		nextPut: $";
		nextPutAll: self message;
		nextPut: $".