*Squot-Mapper-Storing
storeOn: aStream
	aStream
		nextPutAll: '('; 
		nextPutAll: self class name;
		nextPutAll: ' fromByteArray: ';
		store: self asByteArray;
		nextPutAll: ')'.