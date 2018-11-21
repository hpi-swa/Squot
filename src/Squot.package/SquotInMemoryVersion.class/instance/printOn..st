printing
printOn: aStream
	aStream
		nextPutAll: 'in-memory version ';
		print: self identityHash;
		space;
		nextPut: $";
		nextPutAll: (self message contractTo: 60);
		nextPut: $".