printing
printOn: aStream
	aStream nextPutAll: 'diff of ';
		print: originalClass.