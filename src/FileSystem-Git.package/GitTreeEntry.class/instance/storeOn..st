storing
storeOn: aStream.
	aStream 
		nextPutAll: self printMode asByteArray;
		nextPut: Character space asInteger;
		nextPutAll: entryName asByteArray;
		nextPut: 0;
		nextPutAll: entryHash asByteHash