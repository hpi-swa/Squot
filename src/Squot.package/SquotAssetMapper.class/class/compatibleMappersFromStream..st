encodings
compatibleMappersFromStream: aStream
	^ self validEncodings gather: [:each | | mapper |
		mapper := self new
						encoding: each;
						yourself.
		(mapper canReadVersionFrom: aStream)
			ifTrue: [{mapper}]
			ifFalse: [{}]]