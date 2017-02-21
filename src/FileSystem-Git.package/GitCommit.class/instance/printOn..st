printing
printOn: aStream
	super printOn: aStream.
	self message
		ifNotNilDo: [ :msg|
			aStream
				nextPutAll: '(''';
				nextPutAll: msg;
				nextPutAll: ''')' ]