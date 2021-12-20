reading and writing
writeToFile
	| commentLines |
	refsDictionary ifNil: [^ self error: 'Packed references uninitialized'].
	commentLines := OrderedCollection new.
	packedRefsFile readStreamDo: [:stream |
		stream text.
		[stream peek = $#] whileTrue: [commentLines add: (stream upTo: Character lf)]].
	packedRefsFile writeStreamDo: [:stream |
		stream text.
		commentLines do: [:each | stream nextPutAll: each; nextPut: Character lf].
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