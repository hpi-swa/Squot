reading and writing
readFromFile
	packedRefsFile exists ifFalse: [^ self].
	refsDictionary := Dictionary new.
	packedRefsFile readStreamDo: [:stream |
		stream text.
		[stream atEnd] whileFalse:
			[self readNextLineFrom: stream]]