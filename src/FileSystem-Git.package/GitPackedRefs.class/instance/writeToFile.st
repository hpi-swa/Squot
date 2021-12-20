reading and writing
writeToFile
	| endOfCommentLines |
	refsDictionary ifNil: [^ self error: 'Packed references uninitialized'].
	endOfCommentLines := 0.
	packedRefsFile
		readStreamDo:
			[:stream |
			stream text.
			[stream peek = $#] whileTrue:
				[stream skipTo: Character lf.
				endOfCommentLines := stream position]]
		ifAbsent: [].
	packedRefsFile writeStreamDo: [:stream |
		stream text.
		stream truncate: endOfCommentLines; position: endOfCommentLines.
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