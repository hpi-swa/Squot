printing
printOn: aStream
	"Append a sequence of characters to aStream that identify the receiver."

	aStream
		print: owner.
	aStream
		nextPutAll: ' >> ';
		print: reference