printing
printOn: aStream
	aStream nextPutAll: 'version ';
		print: (self message).