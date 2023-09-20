printing
printOn: aStream
	aStream nextPutAll: 'Image at '.
	self path asReference printOn: aStream.
	aStream nextPutAll: ' encoded using '.
	self writerClass printOn: aStream.
		