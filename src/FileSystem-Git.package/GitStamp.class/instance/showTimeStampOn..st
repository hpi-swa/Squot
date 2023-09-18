showing
showTimeStampOn: aStream
	| offset t |
	t := self timeStamp.
	aStream
		nextPutAll: (t dayOfWeekName first: 3); space;
		nextPutAll: (t monthName first: 3); space;
		nextPutAll: (t dayOfMonth printString); space;
		nextPutAll: (t asTime print24); space;
		nextPutAll: (t year printString); space. 
	offset := t offset.
	offset negative
		ifTrue: [aStream nextPut: $-. offset := offset negated]
		ifFalse: [aStream nextPut: $+].
	aStream
		nextPutAll: (offset hours printString forceTo: 2 paddingStartWith: $0);
		nextPutAll: (offset minutes printString forceTo: 2 paddingStartWith: $0).