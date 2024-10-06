printing
storeOn: aStream
	aStream
		nextPut: $(;
		nextPutAll: self class name;
		nextPutAll: ' newFrom: '.
	super storeOn: aStream.
	aStream nextPut: $).