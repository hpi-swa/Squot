printing
printOn: aStream
	aStream
		nextPutAll: self class name asString;
		print: self internalId;
		space;
		nextPut: $";
		nextPutAll: self message;
		nextPut: $".