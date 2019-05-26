reading and writing
writeToFile
	refsDictionary ifNil: [^ self error: 'Packed references uninitialized'].
	packedRefsFile fileStreamDo: [:stream |
		stream text.
		[stream peek = $#] whileTrue: [stream skipTo: Character lf].
		refsDictionary keys sorted do: [:eachRef |
			stream nextPutAll: (refsDictionary at: eachRef);
				nextPut: Character space;
				nextPutAll: eachRef;
				nextPut: Character lf.
			(peeledRefsDictionary at: eachRef) ~= (refsDictionary at: eachRef)
				ifTrue: [stream
							nextPut: $^;
							nextPutAll: (peeledRefsDictionary at: eachRef);
							nextPut: Character lf]].
		stream truncate: stream position].