printing
printOn: aStream
	super printOn: aStream.
	aStream space;
		nextPutAll: ' of ';
		print: self object.