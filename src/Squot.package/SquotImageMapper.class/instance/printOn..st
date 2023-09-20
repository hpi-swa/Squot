printing
printOn: aStream
	super printOn: aStream.
	aStream nextPutAll: ' encoded using '.
	self writerClass printOn: aStream.