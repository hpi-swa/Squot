printing
printOn: aStream
	super printOn: aStream.
	self message
		ifNotNilDo: [ :msg|
			aStream
				nextPutAll: '(';
				nextPutAll: (integerHash ifNil: [''] ifNotNil: [integerHash asHexHash first: 7]);
				space;
				nextPutAll: (msg copyUpTo: Character cr);
				nextPutAll: ')' ]