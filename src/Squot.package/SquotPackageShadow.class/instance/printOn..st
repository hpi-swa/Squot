printing
printOn: aStream
	super printOn: aStream.
	aStream
		nextPutAll: ' of '; nextPutAll: packageName;
		yourself.