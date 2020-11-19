printing
printOn: aStream
	super printOn: aStream.
	aStream
		nextPutAll: ' (';
		print: diffs size;
		nextPutAll: ' diffs)'.