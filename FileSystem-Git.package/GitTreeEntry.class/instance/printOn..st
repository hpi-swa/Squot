printing
printOn: aStream
	super printOn: aStream.
	self entryName ifNil: [ ^ self ].
	aStream
		<< '(''';
		nextPutAll: self entryName;
		<< ''')'.