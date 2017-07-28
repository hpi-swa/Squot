operations
filterBytesFrom: aFileStream at: path
	| crlf |
	aFileStream binary.
	(self shouldTreatFileAsBinary: aFileStream at: path) ifTrue: [^ aFileStream contents].
	crlf := String crlf asByteArray.
	^ ByteArray streamContents: [:stream |
		[aFileStream atEnd] whileFalse:
			[stream nextPutAll: (aFileStream upToAnyOf: crlf).
			(crlf includes: aFileStream back)
				ifTrue: [stream nextPut: crlf second]
				ifFalse: [aFileStream skip: 1].
			aFileStream atEnd
				ifFalse: [aFileStream
						peekFor: crlf first;
						peekFor: crlf second]]]