as yet unclassified
printOn: aStream
	super printOn: aStream.
	aStream
		nextPut: Character space;
		print: title.