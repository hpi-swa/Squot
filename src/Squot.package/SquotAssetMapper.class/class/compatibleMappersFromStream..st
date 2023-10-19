encodings
compatibleMappersFromStream: aStream
	^ self validEncodings gather: [:each | | mapper |
		mapper := self new
						encoding: each;
						yourself.
		aStream reset.
		(mapper canReadVersionFrom: aStream)
			ifTrue: [{mapper}]
			ifFalse: [{}]]