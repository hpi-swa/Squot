printing
printOn: aStream
	| offset |
	aStream
		nextPutAll: name;
		nextPutAll: ' <'; nextPutAll: email; nextPutAll: '> ';
		nextPutAll: timeStamp asUnixTime printString;
		nextPut: Character space.
	offset := timeStamp offset.
	"a negative Duration will return a negative SmallInteger for e.g. #hours.
	To print our custom string we need to prepend our own $- and work with a
	positive Duration."
	offset negative
		ifTrue: [aStream nextPut: $-. offset := offset negated]
		ifFalse: [aStream nextPut: $+].
	aStream
		nextPutAll: (offset hours printString forceTo: 2 paddingStartWith: $0);
		nextPutAll: (offset minutes printString forceTo: 2 paddingStartWith: $0).