printing
printOn: aStream
	aStream
		nextPutAll: self class name;
		nextPutAll: ' on '.
	reference printOn: aStream.
	