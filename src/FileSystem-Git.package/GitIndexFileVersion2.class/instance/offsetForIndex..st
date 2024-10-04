accessing
offsetForIndex: index
	| offset |
	^ self readStreamDo: [:stream |
		stream position: index * 4 + self fourByteOffsetStreamStart.
		offset := (stream next: 4) asInteger.
		"if there are more than 2GB entries (MSB set to 1), lookup in 8-byte offset table"
		(offset >= 16r80000000)
			ifFalse: [offset]
			ifTrue: [
				stream position: (offset bitAnd: 16r7FFFFFFF) * 8 + self eightByteOffsetStreamStart.
				(stream next: 8) asInteger]]