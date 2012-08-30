storing
storeOn: aStream.
	aStream 
		nextPutAll: self printMode;
		space;
		nextPutAll: entryName;
		nullByte;
		nextPutAll: entryHash