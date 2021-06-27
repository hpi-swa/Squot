printing
printOn: aStream
	super printOn: aStream.
	aStream
		nextPut: $(;
		print: visited size; nextPutAll: ' visited in ';
		print: history size; nextPutAll: ' steps, ';
		print: toBeVisited size; nextPutAll: ' remaining, ';
		print: numberOfPathChecks; nextPutAll: ' path checks';
		nextPut: $).