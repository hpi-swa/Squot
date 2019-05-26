reading and writing
readFromFile
	| lastName |
	lastName := nil.
	packedRefsFile exists ifFalse: [^ self].
	refsDictionary := Dictionary new.
	peeledRefsDictionary := Dictionary new.
	packedRefsFile readStreamDo: [:stream |
		stream text.
		[stream atEnd] whileFalse:
			[lastName := self readNextLineFrom: stream previousRefName: lastName]].